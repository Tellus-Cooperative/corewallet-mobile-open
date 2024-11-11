import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/wallet/send/wallet_send_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';
import '../../widgets/qr_scanner.dart';

class WalletSendQR extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;

  const WalletSendQR({super.key, required this.wallet});

  @override
  WalletSendQRState createState() => WalletSendQRState();
}

class WalletSendQRState extends State<WalletSendQR> {
  @override
  Widget build(BuildContext context) {
    TextEditingController publicKeyController = TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Paso 1/4: Dirección del Recipiente",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mainBlack60)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Enviar a Contactos",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Escanea el código QR del usuario.",
                      style: TextStyle(
                        color: mainBlack60,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  QRScannerView(widget.wallet!),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainPrimary80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/icons/Scan.svg'),
                              const Text('Escanea un código QR'),
                              const Icon(Icons.navigate_next)
                            ],
                          ))),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Usuarios Avanzados",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Ingresa la llave pública del usuario a enviar. (Comienza con G...)",
                      style: TextStyle(
                        color: mainBlack60,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  inputTextWithSvgIcon(publicKeyController, 'Llave Pública',
                      icon: 'assets/icons/Key.svg'),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (publicKeyController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Por favor introduzca un wallet valido",
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
                                  return WalletSendAmount(
                                      widget.wallet!, publicKeyController.text);
                                }),
                              ),
                            );
                          },
                          child: const Text('Continuar'))),
                  const SizedBox(height: 50)
                ])),
      ),
    );
  }
}
