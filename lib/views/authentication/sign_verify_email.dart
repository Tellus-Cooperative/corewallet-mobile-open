import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/general.dart';
import '../../providers/main_provider.dart';
import '../../services/profile_service.dart';
import '../widgets/utils.dart';

class SignVerifyEmailPage extends StatefulWidget {
  const SignVerifyEmailPage({super.key});

  @override
  State<SignVerifyEmailPage> createState() => _SignVerifyEmailPageState();
}

class _SignVerifyEmailPageState extends State<SignVerifyEmailPage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildHeader(mainProvider),
            const SizedBox(height: 20),
            _buildPinInput(),
            const SizedBox(height: 20),
            _buildContinueButton(context, mainProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(MainProvider mainProvider) {
    return Column(
      children: <Widget>[
        _buildText('Verificación de Email', 24, FontWeight.bold),
        const SizedBox(height: 10),
        _buildText('Un código de verificación se envió a:', 16,
            FontWeight.normal, mainBlack80),
        const SizedBox(height: 5),
        _buildText(mainProvider.profile!.user!.email!, 14, FontWeight.bold),
      ],
    );
  }

  Widget _buildText(String text, double fontSize,
      [FontWeight fontWeight = FontWeight.normal,
      Color textColor = Colors.black]) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContinueButton(BuildContext context, MainProvider mainProvider) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: mainPrimary90,
        padding: const EdgeInsets.symmetric(vertical: 15),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () async {
        String pinCode = _pinPutController.text;
        if (pinCode.isEmpty) {
          showMessage(
              type: 'error',
              message: 'Escriba el código que fué enviado a su correo',
              context: context);
          return;
        }

        if (pinCode.length != 6) {
          showMessage(
              type: 'error',
              message: 'El código no es completo',
              context: context);
          return;
        }
        ProfileService profileService = ProfileService();
        var status = await profileService.verifyEmailPin(
            id: mainProvider.profileId, pin: pinCode);

        if (status) {
          Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
          Navigator.pushNamed(context, '/');
        } else {
          showMessage(
              type: 'error',
              message: 'No se ha podido verificar su correo.',
              context: context);
        }
      },
      child: const Text(
        'Continuar',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPinInput() {
    return Center(
      child: Pinput(
        length: 6,
        autofocus: true,
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 60,
          width: 60,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: mainPrimary40),
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
}
