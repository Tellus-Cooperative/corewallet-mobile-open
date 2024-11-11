import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/services/account_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/country.model.dart';
import '../../utils/builders.dart';
import '../../utils/form_input.dart';
import '../../utils/validation.dart';
import '../../widgets/loading.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({super.key});

  @override
  State<RestorePasswordPage> createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  bool loadingSession = false;
  final _formLoginKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(text: '');

  AccountService accountService = AccountService();

  List<Country> countries = Country.getCountries();
  Country country = Country.getCountries().first;
  String phoneCode = Country.getCountries().first.phoneCode;

  @override
  void initState() {
    super.initState();
    setState(() {
      loadingSession = false;
      countries = Country.getCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Restablecer contraseña',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Te enviaremos una contraseña temporal a tu correo  electrónico.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: mainBlack60)),
                loadingSession
                    ? const Loading()
                    : Expanded(
                        child: Form(
                          key: _formLoginKey,
                          child: loginRegister(),
                        ),
                      ),
              ])),
    );
  }

  ListView loginRegister() {
    return ListView(
      children: <Widget>[
        formSection(),
        actionSection(),
        const SizedBox(
          height: 20,
        ),
        bottomSection()
      ],
    );
  }

  Widget formSection() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const SizedBox(
          height: 24.0,
        ),
        inputText(emailController, 'Tu correo electrónico', Icons.email),
        const SizedBox(
          height: 24.0,
        ),
      ],
    );
  }

  Container actionSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: mainPrimary90,
              padding: const EdgeInsets.symmetric(vertical: 15)),
          onPressed: () {
            if (_formLoginKey.currentState!.validate()) {
              recoverPassword();
            }
          },
          child: const Text(
            'Recuperar contraseña',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget bottomSection() {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '¿No tienes una cuenta?',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: textSpanGeneral,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: ' Crea una nueva',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: mainPrimary90,
                  fontSize: 16,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.popAndPushNamed(context, '/signup');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  recoverPassword() async {
    String email = emailController.text;

    if (email.isEmpty || !isValidEmail(email)) {
      buildMessageModal(context, 'Error', 'Correo Electrónico inválido');
      return;
    }

    setState(() {
      loadingSession = true;
    });

    var status = await accountService.makePasswordAccount(email: email);

    if (status) {
      if (mounted) {
        Navigator.pushNamed(context, '/restore-password-success');
      }
    } else {
      Fluttertoast.showToast(
          msg: "Error: no esta registrado el correo",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
          backgroundColor: otherErrorDefault,
          textColor: otherWhite);
    }
    setState(() {
      loadingSession = false;
    });
  }
}
