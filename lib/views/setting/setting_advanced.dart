import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/models/api.graphql.dart';
import 'package:corewallet/views/wallet/export/wallet_export_phrase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../providers/wallet_provider.dart';
import '../../services/wallet_service.dart';
import '../wallet/delete/wallet_delete_question.dart';

class SettingAdvancedPage extends StatefulWidget {
  final Wallet$Query$Wallet wallet;

  const SettingAdvancedPage({super.key, required this.wallet});

  @override
  State<SettingAdvancedPage> createState() => _SettingAdvancedPageState();
}

class _SettingAdvancedPageState extends State<SettingAdvancedPage> {
  final _formSettingNotificationKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider homeProvider =
        Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Configuración",
                  style: TextStyle(
                    color: mainBlack100,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(
                height: 30,
              ),
              const Text("Opciones Avanzadas",
                  style: TextStyle(
                    color: mainBlack60,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Form(
                  key: _formSettingNotificationKey,
                  child: configOptions(homeProvider),
                ),
              ),
            ]),
      ),
    );
  }

  Column configOptions(MainProvider mainProvider) {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      const SizedBox(
        height: 24.0,
      ),
      buildOption('Exportar Wallet', 'export', mainProvider),
      const Divider(),
      buildOption('Restablecer contraseña', '', mainProvider),
      const Divider(),
      buildOption('Eliminar Cuenta', 'delete', mainProvider)
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
