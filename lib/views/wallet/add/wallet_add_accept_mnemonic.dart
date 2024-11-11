import 'package:corewallet/providers/wallet_provider.dart';
import 'package:corewallet/views/wallet/add/wallet_add_verify_mnemonic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/main_provider.dart';
import '../../../services/wallet_service.dart';

class WalletAddAcceptMnemonicPage extends StatefulWidget {
  const WalletAddAcceptMnemonicPage({super.key});

  @override
  State<WalletAddAcceptMnemonicPage> createState() =>
      _WalletAddAcceptMnemonicPageState();
}

class _WalletAddAcceptMnemonicPageState
    extends State<WalletAddAcceptMnemonicPage> {
  get onPressed => null;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isEnabled = false;

  WalletService walletService = WalletService();
  bool isViewKey = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    walletProvider.init(profileId: mainProvider.profileId.toDouble());
    walletProvider.addMnemonicWallet();
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
    final walletProvider = Provider.of<WalletProvider>(context, listen: true);
    var mnemonicPhrases = walletProvider.mnemonicPhrases;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerSection(),
            const SizedBox(
              height: 24.0,
            ),
            if (mnemonicPhrases.isNotEmpty)
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  decoration: BoxDecoration(
                      color: mainBlack10,
                      borderRadius: BorderRadius.circular(10)),
                  height: 160,
                  // width: 500,
                  child: GridView.builder(
                      itemCount: mnemonicPhrases.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 8),
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: <Widget>[
                            Text(
                              mnemonicPhrases[index],
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      })),
            const SizedBox(
              height: 24.0,
            ),
            Container(
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: mnemonicPhrases.join(' ')));
                    Fluttertoast.showToast(
                        msg: "Llave Copiada!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0);
                  },
                  child: const Row(children: [
                    Icon(Icons.copy),
                    Text('Copiar en Portapapeles',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainBlack60,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ))
                  ]),
                )),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
                "Copia esta llave en un lugar seguro y ¡No la compartas con nadie!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: 24.0,
            ),
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _isChecked1,
                title: const Text(
                    "Entiendo que no debo compartir esta llave con nadie.",
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
                    "He escrito o copiado esta llave secreta en un lugar seguro. Haz click en la llave secreta para copiarla a tu portafolio.",
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
                  onPressed: _isEnabled ? () => submitData(mnemonicPhrases, walletProvider.mnemonicPhrasesRandom) : null,
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void submitData(List mnemonicPhrases, List mnemonicPhrasesRandom) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (_) => WalletProvider(WalletService()),
                  child: WalletAddVerifyMnemonicPage(
                      mnemonicPhrases: mnemonicPhrases,
                      mnemonicPhrasesRandom: mnemonicPhrasesRandom),
                )));
  }

  Column headerSection() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tu wallet ha sido creada',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                'Esta es tu frase de respaldo secreta. Con esta frase podras recuparar tu cuenta de manera facil y segura.',
                style: TextStyle(
                    color: mainBlack60,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ))
            ],
          )
        ]);
  }
}
