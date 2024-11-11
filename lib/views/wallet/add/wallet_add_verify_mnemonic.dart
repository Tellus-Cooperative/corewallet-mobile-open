import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/main_provider.dart';
import '../../../services/wallet_service.dart';

class WalletAddVerifyMnemonicPage extends StatefulWidget {
  final List mnemonicPhrases;
  final List mnemonicPhrasesRandom;

  const WalletAddVerifyMnemonicPage(
      {super.key,
      required this.mnemonicPhrases,
      required this.mnemonicPhrasesRandom});

  @override
  State<WalletAddVerifyMnemonicPage> createState() =>
      _WalletAddVerifyMnemonicPageState();
}

class _WalletAddVerifyMnemonicPageState
    extends State<WalletAddVerifyMnemonicPage> {
  bool _isChecked1 = false;
  bool _isEnabled = false;

  WalletService walletService = WalletService();
  List mnemonicPhrases = [];
  List mnemonicPhrasesConfirm = [];
  bool isButtonLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() {
    setState(() {
      mnemonicPhrases = widget.mnemonicPhrases;
    });
  }

  void checkButtonState() {
    if (_isChecked1) {
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
    List mnemonicPhrasesRandom = widget.mnemonicPhrasesRandom;

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
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                decoration: BoxDecoration(
                    color: mainBlack10,
                    borderRadius: BorderRadius.circular(10)),
                height: 160,
                // width: 500,
                child: GridView.builder(
                    itemCount: mnemonicPhrasesConfirm.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 8),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                setState(() {
                                  mnemonicPhrasesRandom
                                      .add(mnemonicPhrasesConfirm[index]);
                                  mnemonicPhrasesConfirm.removeAt(index);
                                });
                              },
                              child: Text(
                                mnemonicPhrasesConfirm[index],
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              )),
                        ],
                      );
                    })),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      mnemonicPhrasesConfirm.clear();
                      mnemonicPhrasesRandom = widget.mnemonicPhrasesRandom;
                    });
                  },
                  child: const Row(children: [
                    Icon(Icons.clear),
                    Text('Limpiar selección',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: mainBlack60,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ))
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (mnemonicPhrasesRandom.isNotEmpty)
              Container(
                  padding: EdgeInsets.zero,
                  height: 120,
                  // width: 500,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: mnemonicPhrasesRandom.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 0),
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    mnemonicPhrasesConfirm
                                        .add(mnemonicPhrasesRandom[index]);
                                    mnemonicPhrasesRandom.removeAt(index);
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: mainBlack10,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      mnemonicPhrasesRandom[index],
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ))),
                          ],
                        );
                      })),
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
                    "Entiendo que si pierdo mi llave secreta, perderé el acceso a todos mis tokenes guardados en la dirección relacionada a esta llave secreta.",
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
                  onPressed: _isEnabled && !isButtonLoading
                      ? () => submitData(mainProvider)
                      : null,
                  child: isButtonLoading
                      ? const SpinKitWave(
                          color: Colors.white,
                          size: 20.0,
                        )
                      : const Text(
                          'Continuar',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> submitData(MainProvider mainProvider) async {
    if (listEquals(mnemonicPhrases, mnemonicPhrasesConfirm) == false) {
      Fluttertoast.showToast(
          msg: "El orden de la  frase no es correcta",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return;
    }

    setState(() {
      isButtonLoading = true;
    });

    await walletService.createWallet(
            profileId: mainProvider.profileId,
            mnemonicPhrase: mnemonicPhrases.join(' '));

    if (!mounted) return;

    mainProvider.getWallet();

    setState(() {
      isButtonLoading = false;
    });

    Navigator.popAndPushNamed(context, '/');
  }

  Container buildBoxMnemonic(index, label) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: mainBlack40, borderRadius: BorderRadius.circular(10)),
      child: Text('$index. $label',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          )),
    );
  }

  Column headerSection() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirma tu frase',
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
                'Escribe tu frase secreta en el orden indicado y confirma que la anotaste en un lugar seguro.',
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
