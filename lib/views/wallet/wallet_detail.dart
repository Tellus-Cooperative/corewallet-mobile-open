import 'package:corewallet/models/api.dart';
import 'package:corewallet/models/transaction.model.dart';
import 'package:corewallet/services/wallet_service.dart';
import 'package:corewallet/views/wallet/receive/wallet_receive_qr.dart';
import 'package:corewallet/views/wallet/send/wallet_send_qr.dart';
import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart' as stellar_sdk;

import '../../constants/colors.dart';
import '../../providers/main_provider.dart';
import '../../utils/chart_data.dart';
import '../../utils/filters.dart';

class WalletDetailPage extends StatefulWidget {
  final Wallet$Query$Wallet wallet;
  final Wallet$Query$Wallet$Assets token;

  const WalletDetailPage({super.key, required this.token, required this.wallet});

  @override
  State<WalletDetailPage> createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  bool isLoading = false;
  WalletService walletService = WalletService();

  List<Transaction> transactions = [];
  List<Wallet$Query$Wallet$Assets?>? tokens = [];

  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;
  List chartData = [];
  bool showDeposit = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getWallet();
    });
  }

  getWallet() async {
    setState(() {
      isLoading = true;
      tokens = widget.wallet.assets;
    });
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    stellar_sdk.StellarSDK sdk = mainProvider.isTestnet
        ? stellar_sdk.StellarSDK.TESTNET
        : stellar_sdk.StellarSDK.PUBLIC;

    stellar_sdk.Page<stellar_sdk.OperationResponse> payments = await sdk.payments
        .forAccount(widget.wallet.publicKey!)
        .order(stellar_sdk.RequestBuilderOrder.DESC)
        .execute();

    List<Transaction> currentTransactions = [];
    var dateCurrent = DateTime.now();
    var month = dateCurrent.month;
    List currentChartData = [];
    var currentMonthData = ChartWallet(month: month, deposit: 0, debit: 0);

    for (stellar_sdk.OperationResponse response in payments.records!) {
      if (response is stellar_sdk.PaymentOperationResponse) {
        stellar_sdk.PaymentOperationResponse por = response;
        String assetCode = por.assetCode == null ? 'XLM' : por.assetCode!;

        if (por.transactionSuccessful! && assetCode == widget.token.asset!.symbol!) {
          var createdAt = DateTime.parse(por.createdAt!);

          if (currentMonthData.month != createdAt.month) {
            currentChartData.add(currentMonthData);
            currentMonthData =
                ChartWallet(month: createdAt.month, deposit: 0, debit: 0);
          }

          if (por.sourceAccount == widget.wallet.publicKey) {
            currentMonthData.debit += double.parse(por.amount!);
          } else {
            currentMonthData.deposit += double.parse(por.amount!);
          }

          currentTransactions.add(Transaction(
              transactionHash: por.transactionHash!,
              sourceAccount: por.sourceAccount!,
              createdAt: createdAt,
              amount: filterWalletAmountFormat(por.amount!),
              assetCode: assetCode
          ));
        }
      }
    }

    currentChartData.add(currentMonthData);

    setState(() {
      chartData = buildChardData(dateCurrent, currentChartData);
      transactions = currentTransactions;
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.white,
              child: widget.token.asset!.image!.isEmpty
                  ? SvgPicture.asset(
                      'assets/images/tickers/Stellar.svg',
                    )
                  : Image.network('${widget.token.asset!.image}'),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.token.asset!.symbol!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: isLoading ? const LoadingPage() : detailWallet(mainProvider),
      backgroundColor: mainBlack10,
    );
  }

  Widget detailWallet(MainProvider mainProvider) {
    double factorConversion = mainProvider.factorConversion;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
          decoration: const BoxDecoration(
              color: otherWhite,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Balance total",
                    style: TextStyle(
                      color: mainBlack80,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "${usdToOtherCurrency(widget.token.balance!, 1)} ${widget.token.asset!.symbol!}",
                      style: const TextStyle(
                        color: mainBlack90,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "\$${xlmToOtherCurrency(widget.token.balance!, factorConversion)}",
                      style: const TextStyle(
                          color: mainBlack90,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal)),
                  const SizedBox(
                    height: 10,
                  ),
                  // TODO change to widget
                  // SwitchUsdClp(key: ValueKey('wallet-detail'))
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                        color: mainBlack10,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  mainProvider.currentConversion == 'USD'
                                      ? mainPrimary90
                                      : mainBlack10,
                              padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                              minimumSize: Size.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                mainProvider.setCurrentConversion('USD');
                              });
                            },
                            child: Text(
                              'USD',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: mainProvider.currentConversion == 'USD'
                                      ? otherWhite
                                      : mainBlack100),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  mainProvider.currentConversion == 'CLP'
                                      ? mainPrimary90
                                      : mainBlack10,
                              padding: const EdgeInsets.fromLTRB(6, 5, 6, 5),
                              minimumSize: Size.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                mainProvider.setCurrentConversion('CLP');
                              });
                            },
                            child: Text(
                              'CLP',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: mainProvider.currentConversion == 'CLP'
                                      ? otherWhite
                                      : mainBlack100),
                            ),
                          ),
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return WalletSendQR(wallet: mainProvider.wallet);
                        }),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: mainPrimary80, // <-- Button color
                    // foregroundColor: Colors.red, // <-- Splash color
                  ),
                  child: const Icon(Icons.arrow_upward, color: Colors.white),
                ),
                const Text("Enviar",
                    style: TextStyle(
                      color: mainPrimary80,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return WalletReceiveQR(wallet: mainProvider.wallet);
                        }),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: mainPrimary80, // <-- Button color
                    // foregroundColor: Colors.red, // <-- Splash color
                  ),
                  child: const Icon(Icons.arrow_downward, color: Colors.white),
                ),
                const Text("Recibir",
                    style: TextStyle(
                      color: mainPrimary80,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: const BoxDecoration(
              color: otherWhite,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Transacciones",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              )),
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ver más',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/transaction-list');
                            },
                        ),
                      ],
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          color: mainPrimary90,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                // height: double.maxFinite,
                // alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Image.network(
                                  'https://id.lobstr.co/${transactions[index].sourceAccount}.png'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  truncateMiddle(transactions[index].sourceAccount),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/transaction/arrow_${transactions[index].sourceAccount == widget.wallet.publicKey ? 'left' : 'right'}.svg'),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          DateFormat('dd MMM, kk:mm:ss a')
                                              .format(transactions[index]
                                                  .createdAt),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: mainBlack60))
                                    ]),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                ' ${transactions[index].sourceAccount == widget.wallet.publicKey ? '-' : '+'} \$${xlmToOtherCurrency(transactions[index].amount, factorConversion)}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                  ' ${transactions[index].sourceAccount == widget.wallet.publicKey ? '-' : '+'} ${transactions[index].amount} ${transactions[index].assetCode}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: mainBlack60))
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                      );
                    }),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
