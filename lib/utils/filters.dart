import 'package:corewallet/models/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

filterFullName(var data) {
  var fullName = '';
  if (data.user.firstName != null) {
    fullName += data.user.firstName;
  }

  if (data.user.lastName != null) {
    fullName += " ${data.user.lastName}";
    return fullName;
  }
}

filterWalletFullName(wallet) {
  return "${wallet.emoji} ${wallet.name}";
}

filterWalletAmountFormat(amount) {
  var numberToDecimal = double.parse(amount);
  var f = NumberFormat("###,##0.00", "en_US");
  return f.format(numberToDecimal);
}

Image getAvatarLobstr(String publicKey) {
  return Image.network('https://id.lobstr.co/$publicKey.png');
}

String truncateMiddle(String word) {
  return '${word.substring(0, 2)}...${word.substring(word.length - 3)}';
}

String truncateMiddleToken(String word, {int leftSide = 2, int rightSide = 3}) {
  if (word == 'XLM') {
    return '';
  }

  var newWord = word.split('-');
  word = newWord[0];

  if (newWord.length > 1) {
    word = newWord[1];
  }

  return '${word.substring(0, leftSide)}...${word.substring(word.length - rightSide)}';
}

String xlmToOtherCurrency(String xlm, double factor) {
  double numberToDecimal = double.parse(xlm);
  double conversion = numberToDecimal * factor;

  var f = NumberFormat("###,##0.00", "en_US");
  return f.format(conversion);
}

String getGreeting() {
  String greeting = "";
  DateTime now = DateTime.now();

  int hours = now.hour;

  if (hours >= 1 && hours <= 12) {
    greeting = "Buenos días";
  } else if (hours >= 12 && hours <= 17) {
    greeting = "Buenas tardes";
  } else if (hours >= 18 && hours <= 24) {
    greeting = "Buenas noches";
  }
  return greeting;
}

String totalWallets(List<Wallets$Query$Wallets$Results?> wallets) {
  double totalBalance = 0.00;

  for (var wallet in wallets) {
    totalBalance += double.parse(wallet!.balance!);
  }

  return totalBalance.toString();
}

String totalBalanceWallet(Wallet$Query$Wallet? wallet) {
  if (wallet == null) {
    return '0.00';
  }

  double totalBalance = double.parse(wallet.balance!);

  return totalBalance.toString();
}

String usdToOtherCurrency(String usd, double factor) {
  double numberToDecimal = double.parse(usd);
  double conversion = numberToDecimal * factor;
  String usdString = conversion.toString();

  var qtyZeros = 2;

  if (usdString.contains(".")) {
    var data = usdString.split('.');
    int firstPart = int.parse(data[0]);

    int originalLength = data[1].length;
    int removedZerosLength = int.parse(data[1]).toString().length;

    int diffZeros = originalLength - removedZerosLength;

    if (firstPart == 0) {
      qtyZeros = diffZeros + 2;
    } else {
      if (diffZeros > 1) {
        qtyZeros = 0;
      }
    }
  }

  var decimalPattern = "";

  if (qtyZeros > 0) {
    decimalPattern = ".${"0" * qtyZeros}";
  }

  var f = NumberFormat("###,##0$decimalPattern", "en_US");
  return f.format(conversion);
}
