import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/views/wallet/delete/wallet_delete_confirm.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../models/api.graphql.dart';
import '../../../providers/wallet_provider.dart';
import '../../../services/wallet_service.dart';
import '../../../utils/form_input.dart';
import '../../../utils/wallet_storage.dart';

class WalletDeleteQuestionPage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;

  const WalletDeleteQuestionPage({super.key, this.wallet});

  @override
  WalletDeleteQuestionPageState createState() =>
      WalletDeleteQuestionPageState();
}

class WalletDeleteQuestionPageState extends State<WalletDeleteQuestionPage> {
  WalletService walletService = WalletService();
  String seedEncrypted = '';
  TextEditingController publicKeyController = TextEditingController(text: '');
  bool _isAgreeCheckbox = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() async {
    WalletStorage storage =
        WalletStorage(filename: "${widget.wallet!.id!}.key");
    storage.readWallet().then((value) async {
      setState(() {
        seedEncrypted = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Eliminar Cuenta',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Antes de eliminar tu cuenta, debes respaldar tus fondos en una dirección externa.",
                    style: TextStyle(
                      color: mainBlack60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text("¿Estás seguro que quieres eliminar tu cuenta?",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: mainBlack60)),
                const SizedBox(
                  height: 30,
                ),
                inputTextWithSvgIcon(publicKeyController, 'Llave Pública',
                    icon: 'assets/icons/Key.svg'),
                const SizedBox(
                  height: 30,
                ),
                CheckboxListTile(
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isAgreeCheckbox,
                    title: const Text(
                        "Si, estoy seguro que quiero eliminar mi cuenta.",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: mainPrimary90)),
                    onChanged: (value) {
                      setState(() {
                        _isAgreeCheckbox = value!;
                      });
                      // checkButtonState();
                    })
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: _isAgreeCheckbox
                        ? () async {
                            if (publicKeyController.text !=
                                widget.wallet!.publicKey) {
                              Fluttertoast.showToast(
                                  msg: "Su llave pública no coincide.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  fontSize: 16.0);
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ChangeNotifierProvider<WalletProvider>(
                                        create: (_) =>
                                            WalletProvider(WalletService()),
                                        child: WalletDeleteConfirmPage(
                                            wallet: widget.wallet,
                                            seedEncrypted: seedEncrypted),
                                      )),
                            );
                          }
                        : null,
                    child: const Text('Continuar'))),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
