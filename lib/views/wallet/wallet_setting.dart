import 'package:corewallet/providers/wallet_provider.dart';
import 'package:corewallet/views/wallet/delete/wallet_delete_question.dart';
import 'package:corewallet/views/wallet/export/wallet_export_phrase.dart';
import 'package:corewallet/views/wallet/wallet_edit_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/api.graphql.dart';
import '../../providers/main_provider.dart';
import '../../services/wallet_service.dart';
import '../../utils/filters.dart';

class WalletSettingPage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;
  final Function reload;

  const WalletSettingPage(
      {super.key, required this.wallet, required this.reload});

  @override
  State<WalletSettingPage> createState() => _WalletSettingPageState();
}

class _WalletSettingPageState extends State<WalletSettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
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
            const Text(
              'Ajustes de la wallet',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 24.0,
            ),
            configOptions(mainProvider),
          ],
        ),
      ),
    );
  }

  Column configOptions(MainProvider mainProvider) {
    return Column(children: [
      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        const SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${filterWalletFullName(widget.wallet!)}",
                style: const TextStyle(
                  // color: mainBlack100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            Text(
              "\$ ${xlmToOtherCurrency(widget.wallet!.balance!, mainProvider.factorConversion)}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        buildOption('Personaliza tu wallet', 'edit', mainProvider),
        const Divider(),
        buildOption('Exportar Wallet', 'export', mainProvider),
        const Divider(),
        buildOption('Borrar o Unir Wallet', 'delete', mainProvider)
      ])
    ]);
  }

  Widget buildOption(
    String title,
    String option,
    MainProvider homeProvider,
  ) {
    return TextButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        switch (option) {
          case ('edit'):
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider<WalletProvider>(
                          create: (_) => WalletProvider(WalletService()),
                          child: WalletEditFormPage(
                            wallet: widget.wallet,
                            reload: widget.reload,
                          ),
                        )),
              );
            }
          case ('export'):
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider<WalletProvider>(
                          create: (_) => WalletProvider(WalletService()),
                          child: WalletExportPhrasePage(
                            wallet: widget.wallet,
                          ),
                        )),
              );
            }
          case ('delete'):
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider<WalletProvider>(
                          create: (_) => WalletProvider(WalletService()),
                          child: WalletDeleteQuestionPage(
                            wallet: widget.wallet,
                          ),
                        )),
              );
            }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                color: mainBlack100,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
          const Icon(
            Icons.arrow_forward_ios,
            color: mainBlack60,
          )
        ],
      ),
    );
  }
}
