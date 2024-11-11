import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/utils/filters.dart';
import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/wallet/send/wallet_send_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';

class WalletSendSummary extends StatefulWidget {
  const WalletSendSummary(this.wallet, this.publicKey, this.amount,
      {super.key});

  final Wallet$Query$Wallet wallet;
  final String publicKey;
  final String amount;

  @override
  State<WalletSendSummary> createState() => _WalletSendSummaryState();
}

class _WalletSendSummaryState extends State<WalletSendSummary> {
  String memo = '';
  bool _isChecked1 = true;
  bool _isChecked2 = false;
  final String _suggestedAmount = '0.0005';
  String fee = '0.0005';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    TextEditingController commissionController =
        TextEditingController(text: '');
    TextEditingController memoController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar'),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const Text("Paso 3/4: Sumario",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: mainBlack60)),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recipiente",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: 180,
                  child: Text(widget.publicKey,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Memo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (memo.isNotEmpty)
                      Text(
                        memo,
                      ),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          memoController.text = memo;
                          showSimpleCustomDialog(context, memoController);
                        },
                        child: const Text('Editar',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mainPrimary80,
                            )))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Monto",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${widget.amount} XLM',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(
                        "≈\$${xlmToOtherCurrency(widget.amount, mainProvider.factorConversionXlmToUsd)}",
                        style: const TextStyle(
                          color: mainBlack60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text("Comisión de Red",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: mainBlack5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CheckboxListTile(
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _isChecked1,
                          title: const Text("Sugerida",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: mainPrimary90)),
                          onChanged: (value) {
                            setState(() {
                              _isChecked1 = value!;
                              _isChecked2 = false;
                            });
                            // checkButtonState();
                          })),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('$_suggestedAmount XLM',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                      Text(
                          "≈\$${xlmToOtherCurrency(_suggestedAmount, mainProvider.factorConversionXlmToUsd)}",
                          style: const TextStyle(
                            color: mainBlack60,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: mainBlack5),
              child: CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  value: _isChecked2,
                  title: const Text("Personalizada",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: mainPrimary90)),
                  onChanged: (value) {
                    setState(() {
                      _isChecked2 = value!;
                      _isChecked1 = false;
                    });
                    fee = '';
                    // checkButtonState();
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            if (_isChecked2)
              inputNumber(commissionController, 'Personalizada', Icons.money),
            Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_isChecked1) {
                            fee = _suggestedAmount;
                          } else if (_isChecked2) {
                            fee = commissionController.text;
                          } else {
                            fee = '';
                          }

                          if (fee.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Falta comissión",
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
                                return WalletSendConfirmation(
                                    widget.wallet,
                                    widget.publicKey,
                                    widget.amount,
                                    commissionController.text,
                                    memo);
                              }),
                            ),
                          );
                        },
                        child: const Text('Continuar')))
              ]),
            ),
            const SizedBox(height: 50)
          ])),
    );
  }

  void showSimpleCustomDialog(
      BuildContext context, TextEditingController memoController) {
    AlertDialog simpleDialog = AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: SizedBox(
          height: 200.0,
          child: Column(
            children: [
              const Text('Memo'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: memoController,
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: () {
                  setState(() {
                    memo = memoController.text;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Agregar Memo'),
              )
            ],
          ),
        ));
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}
