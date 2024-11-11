import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/api.graphql.dart';
import '../../providers/main_provider.dart';
import '../../services/wallet_service.dart';
import '../../utils/form_input.dart';

class WalletImportPage extends StatefulWidget {
  const WalletImportPage({super.key});

  @override
  State<WalletImportPage> createState() => _WalletImportPageState();
}

class _WalletImportPageState extends State<WalletImportPage> {
  get onPressed => null;
  bool _obscureText = true;
  TextEditingController privateKeyController = TextEditingController(text: '');
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isEnabled = false;

  WalletService walletService = WalletService();
  CreateWallet$Mutation$CreateWallet createWallet =
      CreateWallet$Mutation$CreateWallet();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() async {}

  void checkButtonState() {
    if (_isChecked1 && _isChecked2 & _isChecked3) {
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
            Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              inputPassword(privateKeyController, 'Llave Privada', Icons.key,
                  _obscureText, _toggle),
            ]),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
                "Copia esta llave en un lugar seguro y ¡No la compartas con nadie!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
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
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _isChecked2,
                title: const Text(
                    "Entiendo que no debo compartir esta llave con nadie.",
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
            CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _isChecked3,
                title: const Text(
                    "He escrito o copiado esta llave secreta en un lugar seguro. Haz click en la llave secreta para copiarla a tu portafolio.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: mainPrimary90)),
                onChanged: (value) {
                  setState(() {
                    _isChecked3 = value!;
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
    String privateKey = privateKeyController.text;

    if(privateKeyController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "La llave privada está vacía",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);
    ImportWallet$Mutation$ImportWallet ? walletTemp = await walletService.importWallet(profileId: mainProvider.profileId, seedKey: privateKey);

    if( walletTemp == null){
      Fluttertoast.showToast(
          msg: "La BIlletera no se puede importar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      return;
    }

    Navigator.popAndPushNamed(context, '/');
  }

  Column headerSection() {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Importar una wallet',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.left,
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            'Importar una wallet con su clave privada le permitirá acceder a los fondos que se encuentran en esa dirección.',
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
