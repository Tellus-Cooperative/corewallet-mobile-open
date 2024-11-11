import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class WalletStorage {
  String filename;

  WalletStorage({required this.filename});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> readWallet() async {
    try {
      final file = await _localFile;

      // Read file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return ''
      return '';
    }
  }

  Future<File> writeWallet(String key) async {
    final file = await _localFile;

    // Write file
    return file.writeAsString(key);
  }
}
