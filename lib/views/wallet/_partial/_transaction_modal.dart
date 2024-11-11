import 'dart:ui';

import 'package:corewallet/models/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wallet_provider.dart';
import '../../../services/wallet_service.dart';
import '../wallet_edit_form.dart';

Future<void> showModalSettingWallet(
    BuildContext context, Wallet$Query$Wallet? wallet, Function getWallet) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (_) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          height: MediaQuery.of(context).size.height / 3,
          child: Center(
            child: Column(
              children: <Widget>[
                builtOptions(
                    context,
                    'Personaliza tu wallet',
                    'Edita el nombre y el ícono.',
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    wallet,
                    getWallet),
                const SizedBox(
                  height: 20,
                ),
                builtExportOption(
                    context,
                    'Exporta',
                    'Exporta la llave secreta de esta wallet.',
                    const Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    wallet,
                    '/wallet-export'),
                const SizedBox(
                  height: 20,
                ),
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
                )
              ],
            ),
          )),
    ),
  );
}

InkWell builtOptions(BuildContext context, String title, String subtitle,
    Icon icon, Wallet$Query$Wallet? wallet, getWallet) {
  return InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider<WalletProvider>(
                    create: (_) => WalletProvider(WalletService()),
                    child: WalletEditFormPage(
                      wallet: wallet,
                      reload: () {
                        getWallet();
                      },
                    ),
                  )),
        );
        // Navigator.pushNamed(context, action);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF88A8BF)),
            child: icon,
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

InkWell builtExportOption(BuildContext context, String title, String subtitle,
    Icon icon, Wallet$Query$Wallet? wallet, action) {
  return InkWell(
      onTap: () {
        // Navigator.pop(context);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (_) => ChangeNotifierProvider<WalletProvider>(
        //             create: (_) => WalletProvider(WalletService()),
        //             child: WalletExportPage(wallet: wallet),
        //           )),
        // );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFF88A8BF)),
            child: icon,
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
