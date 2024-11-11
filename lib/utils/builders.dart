import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/general.dart';

List<Widget> widgetListEmojis = walletEmojis
    .map((el) => Text(
          el,
          style: const TextStyle(fontSize: 30),
        ))
    .toList();

buildMessageModal(BuildContext context, String title, subtitle) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(subtitle),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'))
          ],
        );
      });
}
