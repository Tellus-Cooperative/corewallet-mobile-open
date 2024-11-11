import 'package:corewallet/providers/main_provider.dart';
import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/general.dart';
import '../../providers/profile_provider.dart';

class ProfileAddPinPage extends StatefulWidget {
  const ProfileAddPinPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileAddPinPageState();
}

class _ProfileAddPinPageState extends State<ProfileAddPinPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _pinPutFocusNode = FocusNode();
  bool isValidPinLength = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    final profileProvider = Provider.of<ProfileProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Text("Crea un nuevo Pin",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mainBlack100,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 10),
              const Text("Añade un pin a tu cuenta para hacerla más segura",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: mainBlack60)),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                height: 80.0,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.topCenter,
                child: Center(
                  child: Pinput(
                    length: 4,
                    autofocus: true,
                    onChanged: (String pin) => validatePin(pin),
                    focusNode: _pinPutFocusNode,
                    controller: profileProvider.pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      height: 60,
                      width: 60,
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: mainPrimary80),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: otherErrorLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              profileProvider.isLoading
                  ? const LoadingPage()
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: isValidPinLength
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  updateProfile(profileProvider, mainProvider);
                                }
                              }
                            : null,
                        child: const Text('Continuar'),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  void validatePin(String pin) {
    setState(() {
      isValidPinLength = (pin.length == 4);
    });
  }

  updateProfile(
      ProfileProvider profileProvider, MainProvider mainProvider) async {
    await profileProvider.updateProfilePin(id: mainProvider.profileId);
    if (!mounted) return;
    if (profileProvider.isSaved) {
      Navigator.popAndPushNamed(context, '/onboarding');
    } else {
      showMessage(
          type: 'error',
          message: 'Ha ocurrido un error',
          context: context);
    }
  }
}
