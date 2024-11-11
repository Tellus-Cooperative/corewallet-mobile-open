import 'dart:async';

import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/services/auth_service.dart';
import 'package:corewallet/views/account/profile_pin_form.dart';
import 'package:corewallet/views/setting/setting_advanced.dart';
import 'package:corewallet/views/setting/setting_notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/constants.dart';
import '../../providers/main_provider.dart';
import '../../providers/profile_provider.dart';
import '../../services/profile_service.dart';
import '../widgets/switch_custom.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool existErrors = false;
  final _formLoginKey = GlobalKey<FormState>();

  TextEditingController darkModeController = TextEditingController(text: '');

  AuthService authService = AuthService();
  String version = '0.0.0';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });

    super.initState();
  }

  initialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    MainProvider homeProvider =
        Provider.of<MainProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Configuración",
                    style: TextStyle(
                      color: mainBlack100,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(
                  height: 32,
                ),
                const Text("General",
                    style: TextStyle(
                      color: mainBlack60,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                Form(
                  key: _formLoginKey,
                  child: configOptions(homeProvider),
                ),
                const Text("Síguenos",
                    style: TextStyle(
                      color: mainBlack60,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        'assets/images/setting/twitter.png',
                        height: 64,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        'assets/images/setting/facebook.png',
                        height: 64,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                        'assets/images/setting/instagram.png',
                        height: 64,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                    child: TextButton(
                  onPressed: () {
                    if (homeProvider.profile != null) {
                      homeProvider.resetProfile();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (Route<dynamic> route) => false);
                    } else {
                      Navigator.popAndPushNamed(context, '/sign');
                    }
                  },
                  child: const Text("Cerrar Sesión",
                      style: TextStyle(
                        color: otherErrorDefault,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                )),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text("Becoop Wallet © 2023 v$version",
                      style: const TextStyle(
                        color: greyscaleGrey400,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                )
              ]),
        ),
      ),
    );
  }

  Column configOptions(MainProvider homeProvider) {
    return Column(children: [
      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        const SizedBox(
          height: 24.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Dark Mode",
                style: TextStyle(
                  // color: mainBlack100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            CustomSwitch(
              key: UniqueKey(),
              value: false,
              enableColor: mainBlack60,
              disableColor: mainBlack60,
              onChanged: (value) {
                return;
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        buildOption('Cuentas de Banco', 'bank_accounts', homeProvider),
        buildOption('Opciones Avanzadas', 'advanced', homeProvider),
        buildOption('Cambiar PIN', 'pin', homeProvider),
        buildOption('Notificaciones', 'notification', homeProvider),
        buildOption('Opciones de Privacidad', 'privacy', homeProvider),
        buildOption(
            'Términos y Condiciones de Servicio', 'terms', homeProvider),
        buildOption('Contacto', 'contact', homeProvider),
      ])
    ]);
  }

  Widget buildOption(
    String title,
    String option,
    MainProvider homeProvider,
  ) {
    return TextButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () async {
          switch (option) {
            case ('advanced'):
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider<ProfileProvider>(
                            create: (_) => ProfileProvider(ProfileService()),
                            child: SettingAdvancedPage(
                                wallet: homeProvider.wallet!),
                          )),
                );
              }
            case ('pin'):
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider<ProfileProvider>(
                            create: (_) => ProfileProvider(ProfileService()),
                            child: ProfilePinFormPage(
                              id: homeProvider.profileId,
                            ),
                          )),
                );
              }
            case ('notification'):
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider<ProfileProvider>(
                            create: (_) => ProfileProvider(ProfileService()),
                            child: const SettingNotificationPage(),
                          )),
                );
              }
            case ('privacy'):
              {
                launchUrlBrowser(settingUrlPrivacy);
              }
            case ('terms'):
              {
                launchUrlBrowser(settingUrlTerms);
              }
            case ('contact'):
              {
                final url = Uri(
                  scheme: 'mailto',
                  path: 'hola@becoop.app',
                  query: 'subject=Hello&body=Hello',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  if (kDebugMode) {
                    print("Can't launch $url");
                  }
                }
              }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                  color: mainBlack100,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            const Icon(
              Icons.arrow_forward_ios,
              color: mainBlack60,
            )
          ],
        ));
  }

  Future<void> launchUrlBrowser(String host) async {
    Uri url = Uri.parse(host);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
