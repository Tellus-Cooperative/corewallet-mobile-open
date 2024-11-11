import 'package:corewallet/models/api.dart';
import 'package:corewallet/providers/wallet_provider.dart';
import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/general.dart';
import '../../providers/main_provider.dart';
import '../../utils/builders.dart';

class WalletEditFormPage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;
  final Function reload;

  const WalletEditFormPage({super.key, this.wallet, required this.reload});

  @override
  State<WalletEditFormPage> createState() => _WalletEditFormPageState();
}

class _WalletEditFormPageState extends State<WalletEditFormPage> {
  final _formKey = GlobalKey<FormState>();
  String emojiCode = '';
  int initialItemEmoji = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final walletProvider =
          Provider.of<WalletProvider>(context, listen: false);
      if (widget.wallet == null) {
        walletProvider.initWallet(null);
      } else {
        walletProvider.initWallet(widget.wallet!);
        setState(() {
          emojiCode = widget.wallet!.emoji!;
          initialItemEmoji = walletEmojis.indexOf(emojiCode);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    final walletProvider = Provider.of<WalletProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Personaliza tu wallet",
                    style: TextStyle(
                      color: mainBlack100,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 10),
                const Text(
                    "¡Personaliza tus billeteras! Cambia el\nnombre de cada wallet que crees para\nidentificarlas fácilmente.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: mainBlack60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 40),
                Center(
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 40),
                      child: Text(
                        emojiCode,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    CupertinoButton(
                        child: const Text('Selecciona tu icono'),
                        onPressed: () => showCupertinoModalPopup(
                            context: context,
                            builder: (_) => SizedBox(
                                  width: double.infinity,
                                  height: 250,
                                  child: CupertinoPicker(
                                    backgroundColor: Colors.white,
                                    itemExtent: 40,
                                    scrollController:
                                        FixedExtentScrollController(
                                      initialItem: initialItemEmoji,
                                    ),
                                    children: widgetListEmojis,
                                    onSelectedItemChanged: (int value) {
                                      walletProvider.emojiController.text =
                                          walletEmojis[value];
                                      setState(() {
                                        emojiCode = walletEmojis[value];
                                      });
                                    },
                                  ),
                                ))),
                  ]),
                ),
                inputText(walletProvider.nameController, 'Nombre', Icons.edit),
                const SizedBox(
                  height: 20,
                ),
                walletProvider.isLoading
                    ? const LoadingPage()
                    : buttonConfirm(mainProvider, walletProvider)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonConfirm(
      MainProvider mainProvider, WalletProvider walletProvider) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: const Text('Continuar'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (widget.wallet == null) {
              // createWallet(mainProvider, walletProvider);
            } else {
              updateWallet(walletProvider);
            }
          }
        },
      ),
    );
  }

  updateWallet(WalletProvider walletProvider) async {
    await walletProvider.updateWallet(id: widget.wallet!.id!);
    if (!mounted) return;
    if (walletProvider.isSaved) {
      widget.reload();
      Navigator.pop(context);
      Navigator.pop(context);
      showMessage(
          message: 'Wallet actualizado.',
          context: context);
    } else {
      showMessage(
          type: 'error',
          message: 'Ha ocurrido un error',
          context: context);
    }
  }
}
