import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/colors.dart';
import '../../../services/wallet_service.dart';

class WalletExportPage extends StatefulWidget {
  final String secretKey;

  const WalletExportPage({super.key, required this.secretKey});

  @override
  State<WalletExportPage> createState() => _WalletExportPageState();
}

class _WalletExportPageState extends State<WalletExportPage> {
  get onPressed => null;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isEnabled = false;
  String seedEncrypted = '';
  String publicKey = '';
  bool isViewKey = false;

  WalletService walletService = WalletService();

  @override
  void initState() {
    super.initState();
  }

  void checkButtonState() {
    if (_isChecked1 && _isChecked2 && _isChecked3) {
      setState(() {
        _isEnabled = true;
      });
    } else {
      setState(() {
        _isEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerSection(),
            const SizedBox(
              height: 24.0,
            ),
            isViewKey
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: mainBlack5),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                Clipboard.setData(
                                    ClipboardData(text: widget.secretKey));
                                Fluttertoast.showToast(
                                    msg: "Llave Copiada!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    fontSize: 16.0);
                              },
                              child: Text(widget.secretKey,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                            )),
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: mainBlack5),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isViewKey = true;
                          });
                        },
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Revelar Llave Secreta",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: mainBlack80)),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.visibility_off_rounded,
                                  color: mainBlack60)
                            ])),
                  ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
                "Copia esta llave en un lugar seguro y ¡No la compartas con nadie!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 24.0,
            ),
            CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                value: _isChecked1,
                title: const Text(
                    "Entiendo que si pierdo mi llave secreta, perderé el acceso a todos mis tokenes guardados en la dirección relacionada a esta llave secreta.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mainPrimary90)),
                onChanged: (value) {
                  setState(() {
                    _isChecked1 = value!;
                  });
                  checkButtonState();
                }),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _isChecked2,
                title: const Text(
                    "Entiendo que no debo compartir esta llave con nadie.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mainPrimary90)),
                onChanged: (value) {
                  setState(() {
                    _isChecked2 = value!;
                  });
                  checkButtonState();
                }),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _isChecked3,
                title: const Text(
                    "He escrito o copiado esta llave secreta en un lugar seguro. Haz click en la llave secreta para copiarla a tu portafolio.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mainPrimary90)),
                onChanged: (value) {
                  setState(() {
                    _isChecked3 = value!;
                  });
                  checkButtonState();
                }),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: mainPrimary90,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20)),
                  onPressed: _isEnabled ? () => submitData(context) : null,
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitData(BuildContext context) async {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  }

  Column headerSection() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exporta tu llave privada',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                'Tu wallet se compone de una llave pública y una llave secreta. Una llave secreta comienza con la letra S seguida de 56 caracteres.',
                style: TextStyle(
                    color: mainBlack60,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ))
            ],
          )
        ]);
  }
}
