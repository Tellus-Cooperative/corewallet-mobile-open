import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/services/wallet_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';

class WalletDeleteConfirmPage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;
  final String seedEncrypted;

  const WalletDeleteConfirmPage(
      {super.key, required this.wallet, required this.seedEncrypted});

  @override
  State<WalletDeleteConfirmPage> createState() =>
      _WalletDeleteConfirmPageState();
}

class _WalletDeleteConfirmPageState extends State<WalletDeleteConfirmPage> {
  WalletService walletService = WalletService();

  TextEditingController privateKeyController = TextEditingController(text: '');
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isEnabled = false;
  bool _isSubmitButtonEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  void checkButtonState() {
    if (_isChecked1 && _isChecked2) {
      setState(() {
        _isEnabled = true;
      });
    } else {
      setState(() {
        _isEnabled = false;
      });
    }
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  height: 24.0,
                ),
                const Text(
                    "⚠️ ATENCION: Este paso es irreversible. Una vez tu cuenta sea eliminada, no podrás recuperar acceso a tu wallet.",
                    style: TextStyle(
                      color: mainBlack60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  height: 24.0,
                ),
                CheckboxListTile(
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _isChecked1,
                    title: const Text(
                        "Entiendo que al eliminar mi cuenta no tendré acceso a mis fondos.",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: mainPrimary90)),
                    onChanged: (value) {
                      setState(() {
                        _isChecked1 = value!;
                      });
                      checkButtonState();
                    }),
                CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: _isChecked2,
                    title: const Text(
                        "Entiendo que enviaré todos mis saldos a una cuenta externa antes de eliminar mi cuenta",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: mainPrimary90)),
                    onChanged: (value) {
                      setState(() {
                        _isChecked2 = value!;
                      });
                      checkButtonState();
                    }),
              ],
            )),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: mainPrimary90,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20)),
                  onPressed: _isEnabled && _isSubmitButtonEnabled
                      ? () => submitData(context, mainProvider)
                      : null,
                  child: _isSubmitButtonEnabled
                      ? const Text(
                          'Borrar wallet',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : const SpinKitWave(
                          color: Colors.white,
                          size: 20.0,
                        )),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitData(
      BuildContext context, MainProvider mainProvider) async {
    setState(() {
      _isSubmitButtonEnabled = false;
    });

    bool status = await walletService.deleteWallet(
      walletId: widget.wallet!.id!,
      seedEncrypted: widget.seedEncrypted,
    );

    if (status) {
      mainProvider.resetWallet();
      mainProvider.getWallet();
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {
        _isSubmitButtonEnabled = true;
      });
      Fluttertoast.showToast(
          msg: "Hubo un error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  }
}
