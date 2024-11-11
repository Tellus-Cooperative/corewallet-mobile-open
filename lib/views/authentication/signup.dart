import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/services/account_service.dart';
import 'package:corewallet/utils/form_input.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/country.model.dart';
import '../../utils/builders.dart';
import '../../utils/strings.dart';
import '../../utils/validation.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool loadingSession = false;
  bool _obscureText = true;

  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
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
      appBar: AppBar(
        title: const Text(
          'Mi Cuenta',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Crea tu Cuenta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Crea una cuenta para continuar.',
                    style: TextStyle(
                        color: mainBlack60,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  inputTextWithSvgIcon(fullNameController, 'Nombre Completo',
                      icon: 'assets/icons/User.svg'),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 16),
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
                                backgroundColor: mainBlack5,
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: BoxDecoration(
                              color: mainBlack5,
                              borderRadius: BorderRadius.circular(16)),
                          placeholder: 'Teléfono Móvil',
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  inputText(
                      emailController, 'Tu correo electrónico', Icons.email),
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
                                Navigator.popAndPushNamed(
                                    context, '/restore-password');
                              })
                      ],
                    ))
                  ]),
                  actionSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  bottomSection(),
                ])),
      ),
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
      margin: const EdgeInsets.only(top: 32.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: mainPrimary90,
              padding: const EdgeInsets.symmetric(vertical: 15)),
          child: const Text(
            'Regístrate',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            signUp(phoneController.text, fullNameController.text,
                passwordController.text, emailController.text);
          }),
    );
  }

  Widget bottomSection() {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: '¿Ya tienes una cuenta?',
            style: TextStyle(
                fontFamily: 'Montserrat', color: textSpanGeneral, fontSize: 16),
          ),
          TextSpan(
            text: 'Inicia Sesión',
            style: const TextStyle(
                fontFamily: 'Montserrat', color: mainPrimary90, fontSize: 16),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, '/sign');
              },
          ),
        ],
      ),
    );
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

  signUp(String phone, String fullname, password, String email) async {
    if (fullname == '') {
      buildMessageModal(context, 'Error', 'Su nombre no puede estar vacío.');
      return;
    }

    phone = replaceWhitespacesUsingRegex(phone, '');

    if (phone.isEmpty || !isNumeric(phone) || phone.length < 5) {
      buildMessageModal(context, 'Error', 'Número de teléfono no es válido.');
      return;
    }

    if (email.isEmpty || !isValidEmail(email)) {
      buildMessageModal(context, 'Error', 'Correo inválido');
      return;
    }

    if (password.length < 8) {
      buildMessageModal(
          context, 'Error', 'Su clave debe tener al menos 8 dígitos.');
      return;
    }

    setState(() {
      loadingSession = true;
    });

    phone = phoneCode + phone;

    var status = await accountService.createAccount(
        phone: phone,
        fullName: fullname,
        password: password,
        email: email,
        country: country.code);

    if (status) {
      phoneController.clear();
      passwordController.clear();
      fullNameController.clear();

      if (!mounted) return;
      showMessage(
          message: 'Cuenta creada, por favor inicia sesión', context: context);

      Navigator.popAndPushNamed(context, '/sign');
    } else {
      setState(() {
        showMessage(
            type: 'error',
            message: 'No se pudo crear la cuenta, itenta mas tarde',
            context: context);
        loadingSession = false;
      });
    }
  }
}
