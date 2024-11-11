import 'package:corewallet/views/wallet/export/wallet_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../constants/colors.dart';
import '../../../models/api.graphql.dart';
import '../../../providers/wallet_provider.dart';
import '../../../services/wallet_service.dart';
import '../../../utils/wallet_storage.dart';

class WalletExportPhrasePage extends StatefulWidget {
  final Wallet$Query$Wallet? wallet;

  const WalletExportPhrasePage({super.key, required this.wallet});

  @override
  State<WalletExportPhrasePage> createState() => _WalletExportPhrasePageState();
}

class _WalletExportPhrasePageState extends State<WalletExportPhrasePage> {
  get onPressed => null;
  late TextfieldTagsController _controller;
  List mnemonicPhrases = [];

  bool _isChecked1 = false;
  bool _isEnabled = false;
  String seedEncrypted = '';
  String publicKey = '';
  bool isViewKey = false;

  WalletService walletService = WalletService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    if (kDebugMode) {
      print(_controller.getTags);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
    _controller = TextfieldTagsController();
  }

  initialize() async {
    WalletStorage storage =
        WalletStorage(filename: "${widget.wallet!.id!}.key");
    storage.readWallet().then((value) async {
      if (value == '') {
        Fluttertoast.showToast(
            msg: "No existe llave secreta en el dispositivo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            fontSize: 16.0,
            backgroundColor: otherErrorLight);
        return;
      }

      setState(() {
        seedEncrypted = value;
      });
    });
  }

  void checkButtonState() {
    if (_isChecked1 && seedEncrypted != '') {
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
                          InkWell(
                              onTap: () {
                                setState(() {
                                  mnemonicPhrases.removeAt(index);
                                });
                              },
                              child: Text(
                                mnemonicPhrases[index],
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              )),
                        ],
                      );
                    })),
            TextFieldTags(
              textfieldTagsController: _controller,
              initialTags: const [],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                if (_controller.getTags!.contains(tag)) {
                  return 'Ya has agregado esta frase';
                }
                setState(() {
                  mnemonicPhrases.add(tag);
                });
                return null;
              },
              inputfieldBuilder:
                  (context, tec, fn, error, onChanged, onSubmitted) {
                return ((context, sc, tags, onTagDelete) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: tec,
                      focusNode: fn,
                      decoration: InputDecoration(
                        isDense: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: mainPrimary90,
                            width: 3.0,
                          ),
                        ),
                        hintText: _controller.hasTags
                            ? ''
                            : "Escriba con comas o espacios",
                        errorText: error,
                      ),
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                    ),
                  );
                });
              },
            ),
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
                  onPressed: _isEnabled ? () => submitData(context) : null,
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

  Future<void> submitData(BuildContext context) async {
    var phrases = mnemonicPhrases.join(' ');
    ExportWallet$Mutation$ExportWallet? walletTemp =
        await walletService.exportWallet(
            id: widget.wallet!.id!,
            seedEncryptedKey: seedEncrypted,
            phrases: phrases);
    if (walletTemp == null) {
      Fluttertoast.showToast(
          msg: "La frase no corresponde a la cuenta",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0,
          backgroundColor: otherErrorLight);
      return;
    }

    setState(() {
      publicKey = walletTemp.secretSeed!;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<WalletProvider>(
                create: (_) => WalletProvider(WalletService()),
                child: WalletExportPage(
                  secretKey: publicKey,
                ),
              )),
    );
  }

  Column headerSection() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exporta tu llave privada',
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
                'Escribe tu frase secreta en el orden indicado y confima que la anotaste en un lugar seguro.',
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
