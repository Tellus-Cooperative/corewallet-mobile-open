import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';

class WalletReceiveQR extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;

  const WalletReceiveQR({super.key, required this.wallet});

  @override
  WalletReceiveQRState createState() => WalletReceiveQRState();
}

class WalletReceiveQRState extends State<WalletReceiveQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Recibir',
            style: TextStyle(color: otherWhite),
          ),
          backgroundColor: mainPrimary80,
          foregroundColor: otherWhite,
        ),
        backgroundColor: mainPrimary80,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    decoration: const BoxDecoration(
                        color: otherWhite,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30), bottom: Radius.zero)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "Comparte este código QR o la siguiente dirección para recibir: ${getBuildAssetNames(widget.wallet!.assets!)}.",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: mainBlack60,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          decoration: BoxDecoration(
                              color: otherWhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                (BoxShadow(
                                    color: mainBlack10,
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(0, 3)))
                              ]),
                          child: QrImageView(
                            data: widget.wallet!.publicKey!,
                            size: 250,
                            embeddedImage:
                                const AssetImage('assets/images/logo.png'),
                            embeddedImageStyle: const QrEmbeddedImageStyle(
                              size: Size(
                                50,
                                50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              color: mainBlack5,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(widget.wallet!.publicKey!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              IconButton(
                                icon: const Icon(Icons.content_copy),
                                onPressed: () async {
                                  Clipboard.setData(ClipboardData(
                                      text: widget.wallet!.publicKey!));
                                  Fluttertoast.showToast(
                                      msg: "Cuenta Copiada!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      fontSize: 16.0);
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                            padding: EdgeInsets.zero,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  Share.share(widget.wallet!.publicKey!);
                                },
                                child: const Text('Compartir Dirección'))),
                        const SizedBox(height: 50)
                      ],
                    )),
              ]),
        ));
  }

  String getBuildAssetNames(List assets) {
    var newList = [];
    for (var element in assets) {
      newList.add(element.asset.symbol);
    }
    String originalListString = newList
        .join(', ')
        .split('')
        .reversed
        .join()
        .replaceFirst(',', ' & ')
        .split('')
        .reversed
        .join();
    return originalListString;
  }
}
