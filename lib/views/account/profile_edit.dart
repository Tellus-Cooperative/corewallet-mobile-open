import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/models/country.model.dart';
import 'package:corewallet/models/id_type.model.dart';
import 'package:corewallet/services/profile_service.dart';
import 'package:corewallet/utils/filters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../utils/builders.dart';
import '../../utils/form_input.dart';
import '../../utils/strings.dart';
import '../../utils/validation.dart';
import '../../widgets/loading.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController idTypeController = TextEditingController(text: '');
  TextEditingController idNumberController = TextEditingController(text: '');

  bool _obscureText = true;
  ProfileService profileService = ProfileService();
  bool loadingSession = false;
  bool existErrors = false;
  List<Country> countries = Country.getCountries();
  List<IdType> idTypes = IdType.getAll();
  Country country = Country.getCountries().first;
  Country phoneCountry = Country.getCountries().first;
  IdType idType = IdType(code: '', name: '');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialize();
    });
    super.initState();
  }

  initialize() {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    setState(() {
      country = Country.getCountry(mainProvider.profile!.country!);
      phoneCountry = Country.getCountryFromPhoneCode(
          mainProvider.profile!.mobilePhoneCode);
    });
  }

  void showSimpleCustomDialog(BuildContext context) {
    AlertDialog simpleDialogCountries = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateCurrent) {
        return SizedBox(
            height: 300.0,
            width: 300.0,
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
                      title: Text(countries[index].name),
                      leading: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                              'assets/images/account/flag/${countries[index].flag}'),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          country = countries[index];
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                }));
      }),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => simpleDialogCountries);
  }

  void showPhoneCountryDialog(BuildContext context) {
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
                          phoneCountry = countries[index];
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: true);

    setState(() {
      fullNameController.text = filterFullName(mainProvider.profile);
      userNameController.text = mainProvider.profile!.mobilePhone!;
      emailController.text = mainProvider.profile!.user!.email!;
      if (mainProvider.profile!.idNumber == null) {
        idNumberController.text = '';
      } else {
        idNumberController.text = mainProvider.profile!.idNumber!;
      }
    });

    if (mainProvider.profile!.idType != null) {
      setState(() {
        idType = IdType.getIdType(mainProvider.profile!.idType!);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi Cuenta',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
              icon: const Icon(Icons.settings),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: mainProvider.profile == null
          ? const Loading()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height / 50.0,
                    ),
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'assets/images/account/avatar.png',
                          fit: BoxFit.cover,
                          height: 140,
                          width: 140,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/account/camera.png',
                          height: 40,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: height / 25.0,
                    ),
                    inputText(fullNameController, 'Nombres', Icons.person),
                    const SizedBox(
                      height: 24,
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
                              showPhoneCountryDialog(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                      'assets/images/account/flag/${phoneCountry.flag}'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  phoneCountry.phoneCode,
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
                            controller: userNameController,
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
                            // onChanged: (value) => _runFilter(value, home),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    inputPassword(passwordController, 'Clave', Icons.lock,
                        _obscureText, _toggle),
                    const SizedBox(
                      height: 24,
                    ),
                    inputText(emailController, 'Correo', Icons.email),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: mainBlack5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: CircleAvatar(
                              radius: 19,
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                  'assets/images/account/flag/${country.flag}'),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Text(country.name),
                          ),
                          TextButton(
                              onPressed: () {
                                showSimpleCustomDialog(context);
                              },
                              child: const Text('Cambiar'))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownMenu<IdType>(
                      initialSelection: idType.code.isEmpty ? idTypes.first : idType,
                      controller: idTypeController,
                      // width: width,
                      hintText: "Selecciona tipo de identificación",
                      requestFocusOnTap: true,
                      enableFilter: true,
                      label: const Text('Select Menu'),
                      onSelected: (IdType? menu) {
                        idType = menu!;
                      },
                      dropdownMenuEntries:
                          idTypes.map<DropdownMenuEntry<IdType>>((IdType menu) {
                        return DropdownMenuEntry<IdType>(
                            value: menu, label: menu.name);
                      }).toList(),
                    ),
                    SizedBox(
                      height: height / 25.0,
                    ),
                    inputText(idNumberController, 'Identificación',
                        Icons.credit_card_sharp),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      margin: const EdgeInsets.only(top: 32.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: mainPrimary90,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15)),
                          child: const Text(
                            'Guardar Cambios',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            updateProfile(
                              mainProvider.profileId,
                              userNameController.text,
                              passwordController.text,
                              fullNameController.text,
                              country.code,
                              emailController.text,
                              idType.code,
                              idNumberController.text,
                            );
                          }),
                    ),
                    existErrors
                        ? SizedBox(
                            height: 50.0,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              padding: const EdgeInsets.all(10.0),
                              color: Colors.red,
                              child: const Text(
                                'No se ha podido guardar',
                                style: TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.red),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  updateProfile(id, String phone, String password, String fullname,
      String country, String email, String idType, String idNumber) async {
    if (fullname == '') {
      buildMessageModal(context, 'Error', 'Su nombre no puede estar vacío.');
      return;
    }

    phone = replaceWhitespacesUsingRegex(phone, '');

    if (phone.isEmpty || !isNumeric(phone) || phone.length < 5) {
      buildMessageModal(context, 'Error', 'Número de teléfono no es válido.');
      return;
    }

    if (password != '' && password.length < 8) {
      buildMessageModal(
          context, 'Error', 'Su clave debe tener al menos 8 dígitos.');
      return;
    }

    if (email.isEmpty || !isValidEmail(email)) {
      buildMessageModal(context, 'Error', 'Correo inválido');
      return;
    }

    if (idNumber.isNotEmpty && idType.isEmpty) {
      buildMessageModal(context, 'Error', 'Selecciona tipo de identificación');
      return;
    }

    String username = phoneCountry.phoneCode + phone;

    var status = await profileService.updateProfile(
        id: id,
        username: username,
        password: password,
        fullname: fullname,
        country: country,
        email: email,
        mobilePhone: phone,
        mobilePhoneCode: phoneCountry.phoneCode,
        idType: idType,
        idNumber: idNumber);

    if (status) {
      userNameController.clear();
      fullNameController.clear();

      if (!mounted) return;
      Fluttertoast.showToast(
          msg: "Se ha guardado los cambios",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
      Navigator.popAndPushNamed(context, '/');
    } else {
      setState(() {
        existErrors = true;
        loadingSession = false;
      });
    }
  }
}
