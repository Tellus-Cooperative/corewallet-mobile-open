import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/views/account/profile_edit.dart';
import 'package:corewallet/views/account/profile_pin_add.dart';
import 'package:corewallet/views/authentication/restore_password.dart';
import 'package:corewallet/views/authentication/sign.dart';
import 'package:corewallet/views/authentication/signup.dart';
import 'package:corewallet/views/authentication/restore_password_success.dart';
import 'package:corewallet/views/authentication/sign_verify_email.dart';
import 'package:corewallet/views/landing.dart';
import 'package:corewallet/views/layout/layout.dart';
import 'package:corewallet/views/onboarding.dart';
import 'package:corewallet/views/setting/setting.dart';
import 'package:corewallet/views/wallet/add/wallet_add_accept_mnemonic.dart';
import 'package:corewallet/views/wallet/wallet_import.dart';
import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("394b0127-745b-4c23-a7c7-3a7aaf52a48d");
  // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(),
      child: MaterialApp(
        title: 'Becoop Wallet',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
        ],
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: 'Montserrat',
          primaryColor: Colors.white,
          primaryColorDark: Colors.black54,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: mainPrimary90),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: mainBlack100,
            elevation: 0,
            titleTextStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                color: mainBlack100,
                fontSize: 20),
          ),
          scaffoldBackgroundColor: Colors.white,
          snackBarTheme: const SnackBarThemeData(
              backgroundColor: Color(0xFF676767),
              actionTextColor: otherErrorLight),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder()
          }),
          buttonTheme: const ButtonThemeData(
            buttonColor: mainPrimary90,
            colorScheme: ColorScheme.light(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: mainPrimary90,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal),
          ),
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Montserrat',
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                backgroundColor: mainPrimary90,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    color: Colors.white),
              ),
            )),
        // initialRoute: '/',
        routes: {
          '/landing': (context) => const Landing(),
          '/sign': (context) => const SignPage(),
          '/signup': (context) => const SignupPage(),
          '/restore-password': (context) => const RestorePasswordPage(),
          '/restore-password-success': (context) =>
              const RestorePasswordSuccessPage(),
          '/sign-verify-email': (context) => const SignVerifyEmailPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-add-pin': (context) => const ProfileAddPinPage(),
          '/wallet-add': (context) => const WalletAddAcceptMnemonicPage(),
          '/wallet-import': (context) => const WalletImportPage(),
          '/setting': (context) => const SettingPage(),
          '/onboarding': (context) => const OnboardingPage(),
        },
        home: const CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  CheckAuthState createState() => CheckAuthState();
}

class CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    mainProvider.initOnesignal();

    setState(() {
      mainProvider.setEnvironmentMode(isTestnet: false);
      _isLoading = true;
    });

    bool userLogged = await mainProvider.checkLoginStatus(context);
    if (userLogged) {
      mainProvider.updateProfileCodeOneSignal(mainProvider.oneSignalCode);

      setState(() {
        isAuth = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (_isLoading) {
      child = const LoadingPage();
    } else {
      if (isAuth) {
        child = const LayoutPage();
      } else {
        return const Scaffold(
          body: Landing(),
        );
      }
    }
    return Scaffold(
      body: child,
    );
  }
}
