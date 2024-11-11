import 'package:corewallet/views/widgets/loading_page.dart';
import 'package:corewallet/views/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/general.dart';
import '../../providers/profile_provider.dart';

class ProfilePinFormPage extends StatefulWidget {
  final int? id;

  const ProfilePinFormPage({super.key, this.id});

  @override
  State<ProfilePinFormPage> createState() => _ProfilePinFormPageState();
}

class _ProfilePinFormPageState extends State<ProfilePinFormPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _pinPutFocusNode = FocusNode();
  bool isValidPinLength = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Cambia tu PIN",
                    style: TextStyle(
                      color: mainBlack100,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    )),
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
                profileProvider.isLoading
                    ? const LoadingPage()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: isValidPinLength
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    updateProfile(profileProvider);
                                  }
                                }
                              : null,
                          child: const Text('Cambiar'),
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

  updateProfile(ProfileProvider profileProvider) async {
    await profileProvider.updateProfilePin(id: widget.id!);
    if (!mounted) return;
    if (profileProvider.isSaved) {
      Navigator.pop(context);
      showMessage(
          message: 'PIN actualizado.',
          context: context);
    } else {
      showMessage(
          type: 'error',
          message: 'Ha ocurrido un error',
          context: context);
    }
  }
}
