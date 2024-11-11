import 'dart:ui';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/views/swap/swap_token.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wallet/receive/wallet_receive_qr.dart';
import '../wallet/send/wallet_send_qr.dart';
import '../wallet/send/wallet_send_summary.dart';
import '../widgets/utils.dart';

Future<void> showModalTransaction(BuildContext context) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), bottom: Radius.zero)),
          padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              builtOptions(
                  context,
                  'Enviar',
                  'Envía criptomonedas a una cuenta publica.',
                  'assets/icons/Right.svg',
                  'wallet-send'),
              const SizedBox(
                height: 20,
              ),
              builtOptions(
                  context,
                  'Recibir',
                  'Recibe criptomonedas en tu wallet.',
                  'assets/icons/Left.svg',
                  'wallet-receive'),
              const SizedBox(
                height: 20,
              ),
              builtOptions(
                  context,
                  'Retirar',
                  'Compra criptomonedas en Stellar.',
                  'assets/icons/Left.svg',
                  'withdraw'),
              const SizedBox(
                height: 20,
              ),
              builtOptions(
                  context,
                  'Depositar',
                  'Vende tus criptomonedas por USD.',
                  'assets/icons/Left.svg',
                  'deposit'),
              const SizedBox(
                height: 20,
              ),
              builtOptions(
                  context,
                  'Cambiar',
                  'Intercambia una criptomoneda por otra.',
                  'assets/icons/Change.png',
                  'swap-token'),
              const SizedBox(
                height: 20,
              ),
              builtOptions(
                  context,
                  'Pagar',
                  'Paga en tu negocio favorito con cripto.',
                  'assets/icons/Receive Cash.png',
                  'pay'),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0)),
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(Icons.close),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )),
    ),
  );
}

InkWell builtOptions(BuildContext context, String title, String subtitle,
    String imagePath, String action) {
  MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

  return InkWell(
      onTap: () {
        switch (action) {
          case 'wallet-send':
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return WalletSendQR(wallet: mainProvider.wallet);
                  }),
                ),
              );
            }
          case 'wallet-receive':
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return WalletReceiveQR(wallet: mainProvider.wallet);
                  }),
                ),
              );
            }
          case 'swap-token':
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return SwapTokenPage(wallet: mainProvider.wallet);
                  }),
                ),
              );
            }
          case 'pay':
            {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AiBarcodeScanner(
                      appBar: AppBar(),
                      validator: (value) {
                        return value.contains('becoop:');
                      },
                      canPop: false,
                      onScan: (String value) {
                        debugPrint(value);
                        String publicKey = value.split(':')[1].split('?')[0];
                        String amount =
                            value.split(':')[1].split('?')[1].split('=')[1];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return WalletSendSummary(
                                  mainProvider.wallet!, publicKey, amount);
                            }),
                          ),
                        );
                      },
                      onDetect: (p0) {},
                      onDispose: () {
                        debugPrint("Barcode scanner disposed!");
                      },
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.noDuplicates,
                      ),
                      bottomBarText: 'Escanea un QR'),
                ),
              );
            }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF88A8BF)),
            padding: const EdgeInsets.all(5),
            child: loadImgOrSvg(imagePath),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF15141F),
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,
            ),
          ]),
        ],
      ));
}
