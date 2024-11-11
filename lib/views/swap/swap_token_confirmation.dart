import 'package:corewallet/services/profile_service.dart';
import 'package:corewallet/services/transaction_service.dart';
import 'package:corewallet/views/swap/swap_token_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/general.dart';
import '../../../models/api.graphql.dart';
import '../../../providers/main_provider.dart';
import '../../../utils/wallet_storage.dart';
import '../widgets/utils.dart';

class SwapTokenConfirmation extends StatefulWidget {
  final Wallet$Query$Wallet wallet;
  final String amount;
  final int assetOriginId;
  final int assetDestinyId;


  const SwapTokenConfirmation(
      this.wallet, this.amount, this.assetOriginId, this.assetDestinyId,
      {super.key});

  @override
  State<SwapTokenConfirmation> createState() => _SwapTokenConfirmationState();
}

class _SwapTokenConfirmationState extends State<SwapTokenConfirmation> {
  final FocusNode _pinPutFocusNode = FocusNode();
  bool isValidPinLength = false;
  bool isButtonLoading = false;
  String seedEncrypted = '';

  TextEditingController pinController = TextEditingController(text: '');
  TransactionService transactionService = TransactionService();
  ProfileService profileService = ProfileService();

  @override
  void initState() {
    initializeStorage();
    super.initState();
  }

  initializeStorage() {
    WalletStorage storage = WalletStorage(filename: "${widget.wallet.id}.key");
    storage.readWallet().then((value) => {seedEncrypted = value});
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Paso 4/4: Confirmar Transacción",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainBlack60)),
            Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(32)),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Introduce tu PIN",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Container(
                        color: Colors.white,
                        height: 80.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        alignment: Alignment.topCenter,
                        child: Center(
                          child: Pinput(
                            length: 4,
                            autofocus: true,
                            onChanged: (String pin) => validatePin(pin),
                            focusNode: _pinPutFocusNode,
                            controller: pinController,
                            defaultPinTheme: defaultPinTheme,
                            obscureText: true,
                            focusedPinTheme: defaultPinTheme.copyWith(
                              height: 60,
                              width: 60,
                              decoration: defaultPinTheme.decoration!.copyWith(
                                border: Border.all(color: mainPrimary80),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyWith(
                              decoration: BoxDecoration(
                                color: otherErrorLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: isValidPinLength && !isButtonLoading
                        ? () async {
                            bool isCorrectPin =
                                await profileService.verifyProfilePin(
                                    id: mainProvider.profileId,
                                    pin: pinController.text);

                            if (!isCorrectPin) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Pin Incorrecto ó No ha configurado su PIN aún",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                              return;
                            }

                            setState(() {
                              isButtonLoading = true;
                            });

                            bool status =
                                await transactionService.createSwapToken(
                                    walletId: widget.wallet.id!,
                                    seedEncrypted: seedEncrypted,
                                    assetOriginId: widget.assetOriginId,
                                    assetDestinyId: widget.assetDestinyId,
                                    amount: widget.amount);

                            if (!status) {
                              showMessage(
                                  type: 'error',
                                  message:
                                      'No se puede cambiar, intente mas tarde',
                                  context: context);
                              return;
                            }

                            setState(() {
                              isButtonLoading = false;
                            });

                            if (status) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) {
                                    return SwapTokenSuccess(
                                        widget.wallet, widget.amount);
                                  }),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Hubo un error",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                            }
                          }
                        : null,
                    child: isButtonLoading
                        ? const SpinKitWave(
                            color: Colors.white,
                            size: 20.0,
                          )
                        : const Text('Enviar'))),
            const SizedBox(height: 50)
          ]),
    );
  }

  void validatePin(String pin) {
    setState(() {
      isValidPinLength = (pin.length == 4);
    });
  }
}
