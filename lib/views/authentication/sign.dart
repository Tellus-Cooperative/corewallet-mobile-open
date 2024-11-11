import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/services/auth_service.dart';
import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/authentication/sign_verify_code.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../config/environment.dart';
import '../../models/country.model.dart';
import '../../providers/main_provider.dart';
import '../../utils/builders.dart';
import '../../utils/strings.dart';
import '../../widgets/loading.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool loadingSession = false;
  final _formLoginKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  AuthService authService = AuthService();
  List<Country> countries = Country.getCountries();
  Country country = Country.getCountries().first;
  String phoneCode = Country.getCountries().first.phoneCode;

  @override
  void initState() {
    super.initState();
    setState(() {
      loadingSession = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerSection(),
            loadingSession
                ? const Loading()
                : Expanded(
                    child: Form(
                      key: _formLoginKey,
                      child: loginRegister(),
                    ),
                  ),
          ]),
    );
  }

  ListView loginRegister() {
    return ListView(
      children: <Widget>[formSection(), actionSection(), bottomSection()],
    );
  }

  Container headerSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '¡Hola,\nBienvenido de Nuevo!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            'Iniciar sesión en su cuenta.',
            style: TextStyle(
                color: mainBlack60, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Container formSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainBlack5,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: InkWell(
                onTap: () {
                  showSimpleCustomDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                          'assets/images/account/flag/${country.flag}'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      phoneCode,
                      style: const TextStyle(color: mainBlack60),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: CupertinoTextField(
                // focusNode: _focusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: BoxDecoration(
                    color: mainBlack5, borderRadius: BorderRadius.circular(16)),
                placeholder: 'Teléfono Móvil',
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: mainBlack60,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
                prefix: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                placeholderStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                // onChanged: (value) => _runFilter(value, home),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        inputPasswordWithSvgIcon(
            passwordController, 'Clave', _obscureText, _toggle,
            icon: 'assets/icons/Lock.svg'),
        const SizedBox(
          height: 24.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: '¿Has olvidado tu contraseña?',
                  style: const TextStyle(
                    color: mainPrimary90,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.popAndPushNamed(context, '/restore-password');
                    })
            ],
          ))
        ]),
      ]),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Container actionSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(top: 32.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: mainPrimary90,
              padding: const EdgeInsets.symmetric(vertical: 15)),
          onPressed: () {
            if (_formLoginKey.currentState!.validate()) {
              signIn(phoneController.text, passwordController.text);
            }
          },
          child: const Text(
            'Inicia Sesión',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }

  Container bottomSection() {
    return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
        child: Column(children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: '¿No tienes una cuenta?',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: textSpanGeneral,
                      fontSize: 16),
                ),
                TextSpan(
                  text: ' Crea una nueva',
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: mainPrimary90,
                      fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.popAndPushNamed(context, '/signup');
                    },
                ),
              ],
            ),
          )
        ]));
  }

  void showSimpleCustomDialog(BuildContext context) {
    AlertDialog simpleDialogCountries = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Selecciona el código de tu País',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300.0,
            width: 300.0,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 5,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: countries.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 5);
                },
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: mainBlack5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            countries[index].name,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(${countries[index].phoneCode})',
                            style: const TextStyle(
                              color: mainBlack60,
                            ),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        radius: 16,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                              'assets/images/account/flag/${countries[index].flag}'),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          country = countries[index];
                          phoneCode = country.phoneCode;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => simpleDialogCountries,
    );
  }

  signIn(String username, password) async {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      buildMessageModal(context, 'Error', 'Teléfono o Clave esta vacío.');
      return;
    }

    setState(() {
      loadingSession = true;
    });
    String phone = replaceWhitespacesUsingRegex(username, '');
    phone = phoneCode + phone;

    var token = await authService.signIn(username: phone, password: password);

    if (token != null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return LoginVerifyCodePage(phoneNumber: phone, password: password);
      // }));
      MainProvider home = Provider.of<MainProvider>(context, listen: false);

      home.updateItemSharedPreferences('token', token);
      Environment.setPrivateToken(token);

      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/');
    } else {
      showMessage(type: 'error', message: 'Télefono o Clave incorrectos.', context: context);

      setState(() {
        loadingSession = false;
      });
    }
  }
}
