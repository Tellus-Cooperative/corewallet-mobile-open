import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/wallet/send/wallet_send_summary.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';
import '../../widgets/switch_custom.dart';

class WalletSendAmount extends StatelessWidget {
  const WalletSendAmount(this.wallet, this.publicKey, {super.key});

  final Wallet$Query$Wallet wallet;
  final String publicKey;

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar'),
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Paso 2/4: Monto a Enviar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mainBlack60)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Elige el Monto a Enviar",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "Selecciona un token e ingresa la cantidad que deseas enviar.",
                      style: TextStyle(
                        color: mainBlack60,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  inputText(amountController, 'Monto', Icons.money),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Total Disponible",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text("${wallet.balance} XLM",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Usar Máximo",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          const SizedBox(
                            width: 5.0,
                          ),
                          CustomSwitch(
                              key: const ValueKey('value'),
                              value: false,
                              enableColor: mainBlack80,
                              disableColor: mainBlack60,
                              onChanged: (value) {})
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            var amount = amountController.text;
                            var doubleAmount = double.parse(amount);

                            if (amount.isEmpty || doubleAmount <= 0) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Por favor introduzca un monto valido, el monto debe ser mayor a 0",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                              return;
                            }

                            var walletMaximumValue =
                                double.parse(wallet.balance!);

                            if (doubleAmount > walletMaximumValue) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Por favor introduzca un monto inferior o igual al balance",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                              return;
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) {
                                  return WalletSendSummary(
                                      wallet, publicKey, amountController.text);
                                }),
                              ),
                            );
                          },
                          child: const Text('Continuar'))),
                  const SizedBox(height: 40)
                ])),
      ),
    );
  }
}
