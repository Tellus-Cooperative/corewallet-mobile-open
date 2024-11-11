import 'package:corewallet/config/environment.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/utils/filters.dart';
import 'package:corewallet/views/wallet/wallet_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/profile_provider.dart';
import '../../services/profile_service.dart';
import '../wallet/wallet_add_token.dart';

Container homePartial(
  BuildContext context,
  MainProvider mainProvider,
  bool obscureBalance,
  void Function() toggleObscureBalance,
) {
  var tokens = [];

  if (mainProvider.wallet != null) {
    tokens = mainProvider.wallet!.assets!;
  }

  double factorConversion = mainProvider.factorConversion;

  return Container(
      color: mainBlack5,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        children: [
          const SizedBox(height: 50),
          headerSection(context),
          if (kDebugMode) const SizedBox(height: 15),
          if (kDebugMode) summarySection(context, mainProvider),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
            decoration: BoxDecoration(
                color: otherWhite, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    const Text(
                      "Balance total",
                      style: TextStyle(
                        color: mainBlack80,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Container(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: mainBlack20,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            obscureBalance
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            toggleObscureBalance();
                          },
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    obscureBalance
                        ? "\$${xlmToOtherCurrency(totalBalanceWallet(mainProvider.wallet), mainProvider.factorConversion)}"
                        : '\$***.**',
                    style: const TextStyle(
                        color: mainBlack90,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  margin: EdgeInsets.zero,
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
                            mainProvider.setCurrentConversion('USD');
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
                            mainProvider.setCurrentConversion('CLP');
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
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Expanded(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Tu Billetera",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(Icons.add, size: 18),
                                ),
                                TextSpan(
                                  text: 'Añadir Token',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      if (mainProvider.walletId == null) {
                                        Navigator.pushNamed(context, '/');
                                        return;
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ChangeNotifierProvider<
                                                    ProfileProvider>(
                                                  create: (_) =>
                                                      ProfileProvider(
                                                          ProfileService()),
                                                  child: WalletAddTokenPage(
                                                    wallet:
                                                        mainProvider.wallet!,
                                                  ),
                                                )),
                                      );
                                    },
                                ),
                              ],
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: mainPrimary90,
                                  fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: tokens.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) {
                                              return WalletDetailPage(
                                                  token: tokens[index]!,
                                                  wallet: mainProvider.wallet!);
                                            }),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: otherWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 20,
                                                  color: mainBlack20,
                                                )
                                              ]),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: mainBlack100,
                                                radius: 20,
                                                child: CircleAvatar(
                                                    radius: 19,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: tokens[index]!
                                                            .asset!
                                                            .image!
                                                            .isEmpty
                                                        ? SvgPicture.asset(
                                                            'assets/images/tickers/Stellar.svg',
                                                          )
                                                        : Image.network(
                                                            '${tokens[index]!.asset!.image}')),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${tokens[index]!.asset!.symbol}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        '${xlmToOtherCurrency(tokens[index]!.balance, 1)} ${tokens[index]?.asset?.symbol}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '\$${xlmToOtherCurrency(tokens[index]!.balance!, factorConversion)}',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )));
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10);
                                }),
                          )),
                      if (tokens.length > 3)
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ver más',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/wallet-list');
                                  },
                              ),
                            ],
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                color: mainPrimary90,
                                fontSize: 14),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )))
        ],
      ));
}

Container headerSection(BuildContext context) {
  MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${getGreeting()},',
            style: const TextStyle(
                color: mainBlack60,
                fontSize: 16,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          Text(
            mainProvider.profile == null
                ? 'Usuario'
                : filterFullName(mainProvider.profile),
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ]),
        const CircleAvatar(
          backgroundImage: ExactAssetImage('assets/images/account/avatar.png'),
          radius: 25,
        )
      ],
    ),
  );
}

Container summarySection(BuildContext context, MainProvider mainProvider) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 11),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.sync, size: 18),
              ),
              TextSpan(
                text: mainProvider.isTestnet ? 'Testnet' : 'Público',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    var newValueTestNet = !mainProvider.isTestnet;

                    mainProvider.setIsTestnet(newValueTestNet);
                    Environment.setEnvironment(newValueTestNet);

                    await mainProvider.checkLoginStatus(context);

                    mainProvider.getWallet();
                    mainProvider.reloadAssetList();
                  },
              ),
            ],
            style: const TextStyle(
                fontFamily: 'Montserrat', color: mainPrimary90, fontSize: 14),
          ),
        ),
      ],
    ),
  );
}
