import 'dart:async';

import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../config/environment.dart';
import '../../constants/colors.dart';
import '../../constants/general.dart';
import '../../providers/main_provider.dart';
import '../../services/auth_service.dart';
import '../../services/profile_service.dart';
import '../widgets/utils.dart';

class LoginVerifyCodePage extends StatefulWidget {
  final String phoneNumber;
  final String password;

  const LoginVerifyCodePage(
      {super.key, required this.phoneNumber, required this.password});

  @override
  State<LoginVerifyCodePage> createState() => _LoginVerifyCodePageState();
}

class _LoginVerifyCodePageState extends State<LoginVerifyCodePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  bool loadingSigning = false;
  bool showEditName = false;

  int timeCounter = 60;
  Timer _timerClock = Timer(const Duration(milliseconds: 1), () {});

  ConfirmationResult? confirmationResult;
  String? _verificationId;
  User? firebaseUser;
  String? token;
  ProfileService profileService = ProfileService();
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _auth.setLanguageCode("es");
    _auth.signOut();
    verifyPhoneNumber();
  }

  @override
  void dispose() {
    _pinPutController.dispose();
    _timerClock.cancel();
    super.dispose();
  }

  runTimer() {
    setState(() {
      _timerClock = Timer.periodic(const Duration(seconds: 1), _getTime);
    });
  }

  void _getTime(Timer timer) {
    setState(() {
      timeCounter--;
      if (_timerClock.tick == 60) {
        _timerClock.cancel();
        loadingSigning = false;
        _pinPutController.clear();
        Navigator.pop(context);
      }
    });
  }

  getProfile() async {
    _timerClock.cancel();
    MainProvider home = Provider.of<MainProvider>(context, listen: false);
    var token = await authService.signIn(
        username: widget.phoneNumber, password: widget.password);
    if (token != null) {
      home.updateItemSharedPreferences('token', token);
      Environment.setPrivateToken(token);

      if (!mounted) return;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/');
    } else {
      if (!mounted) return;
      showMessage(
          type: 'error',
          message: 'Usuario o Clave incorrectos',
          context: context);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: _scaffoldKey,
      body:
          // showEditName
          //     ? EditUserBillingPage(user: firebaseUser!, token: token!)
          //     :
          SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.99,
          padding: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: screenCode(),
        ),
      ),
    );
  }

  Widget screenCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Autentificación SMS",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const Text("Un código de autentificación se envió a",
            style: TextStyle(
              fontSize: 16,
              color: mainBlack60,
              fontWeight: FontWeight.normal,
            )),
        Text(widget.phoneNumber,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
        _verificationId != null
            ? pinInput()
            : const Text(
                'Espere un momento, estamos verificando su número.',
                style: TextStyle(color: mainBlack80),
              ),
        if (_verificationId != null)
          const Text(
            'Por favor ingrese el código que se le ha enviado a su teléfono.',
            style: TextStyle(color: mainBlack80),
          ),
        if (timeCounter != 60)
          Center(
            child: Text(
              '00:${timeCounter.toString().length < 2 ? "0$timeCounter" : timeCounter.toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: mainBlack80,
              ),
            ),
          ),
        if (loadingSigning) const Center(child: LoadingPage())
      ],
    );
  }

  Widget pinInput() {
    return Center(
      child: Pinput(
        length: 6,
        autofocus: true,
        onCompleted: (String pin) => signInWithPhoneNumber(),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 60,
          width: 60,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: mainPrimary90),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: otherErrorLight,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void signInWithPhoneNumber() async {
    setState(() {
      loadingSigning = true;
    });

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _pinPutController.text,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      user!.getIdToken().then((String? value) {
        setState(() {
          firebaseUser = user;
          token = value;
        });
        getProfile();
      });
    } catch (e) {
      showMessage(
          type: 'error',
          message: "Código de verificación INCORRECTO",
          context: context);
      setState(() {
        loadingSigning = false;
      });
    }
  }

  verifyForApk(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      setState(() {
        loadingSigning = false;
      });
      showMessage(
          type: 'error',
          message: "Error al verificar número",
          context: context);
      Navigator.pop(context);
    }
  }

  void verifyPhoneNumber() async {
    setState(() {
      loadingSigning = true;
    });

    String phoneNumber = widget.phoneNumber;
    verifyForApk(phoneNumber);
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final User? user =
          (await _auth.signInWithCredential(phoneAuthCredential)).user;

      user!.getIdToken().then((String? value) {
        setState(() {
          firebaseUser = user;
          token = value;
        });
        getProfile();
      });
      if (!mounted) return;
      showMessage(message: "Verificación completada", context: context);
      setState(() {
        loadingSigning = false;
      });
    } catch (e) {
      showMessage(message: e.toString(), context: context);
      setState(() {
        loadingSigning = false;
      });
    }
  }

  void verificationFailed(FirebaseAuthException authException) {
    setState(() {
      loadingSigning = false;
    });
    if (kDebugMode) {
      print(authException);
    }
    showMessage(
        type: 'error',
        message: 'Demasiados intentos, Por favor intente más tarde',
        context: context);
  }

  void codeSent(String verificationId, int? forceResendingToken) async {
    showMessage(
        message: 'Se ha enviado un código a su teléfono', context: context);
    _verificationId = verificationId;
    setState(() {
      loadingSigning = false;
    });
    Future.delayed(const Duration(seconds: 1), () {
      runTimer();
    });
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
    setState(() {
      loadingSigning = false;
    });
  }
}
