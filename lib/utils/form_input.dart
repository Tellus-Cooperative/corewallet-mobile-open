import 'package:corewallet/providers/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

CupertinoTextField inputText(
    TextEditingController inputController, String label, IconData icon) {
  return CupertinoTextField(
    // focusNode: _focusNode,
    textInputAction: TextInputAction.next,
    controller: inputController,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(16)),
    placeholder: label,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: mainBlack60,
        fontWeight: FontWeight.w400,
        letterSpacing: 1),
    prefix: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Icon(icon, color: mainBlack60),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // onChanged: (value) => _runFilter(value, home),
  );
}

CupertinoTextField inputTextWithSvgIcon(
    TextEditingController inputController, String placeholder,
    {String icon = ''}) {
  return CupertinoTextField(
    // focusNode: _focusNode,
    textInputAction: TextInputAction.next,
    controller: inputController,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(16)),
    placeholder: placeholder,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: mainBlack60,
        fontWeight: FontWeight.w400,
        letterSpacing: 1),
    prefix: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(mainBlack60, BlendMode.srcIn),
      ),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // onChanged: (value) => _runFilter(value, home),
  );
}

CupertinoTextField inputNumber(
    TextEditingController inputController, String label, IconData icon) {
  return CupertinoTextField(
    clearButtonMode: OverlayVisibilityMode.editing,
    controller: inputController,
    // Add this
    prefix: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
      ),
    ),
    style: const TextStyle(
      fontFamily: 'Montserrat',
      color: mainBlack60,
      fontWeight: FontWeight.w400,
    ),
    keyboardType: TextInputType.number,
    maxLength: 10,
    maxLines: 1,
    // maxLengthEnforcement: true,
    placeholder: label,
    // onChanged: (v) {
    //   print(v);
    // },
    decoration: BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: CupertinoColors.inactiveGray,
      ),
      borderRadius: BorderRadius.circular(32.0),
    ),
  );
}

CupertinoTextField inputPassword(TextEditingController inputController,
    String label, IconData icon, bool obscureText, void Function() toggle) {
  return CupertinoTextField(
    // focusNode: _focusNode,
    textInputAction: TextInputAction.next,
    controller: inputController,
    obscureText: obscureText,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(16)),
    placeholder: label,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        color: mainBlack60,
        fontWeight: FontWeight.normal,
        letterSpacing: 1),
    prefix: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Icon(icon, color: mainBlack60),
    ),
    suffix: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: GestureDetector(
        onTap: toggle,
        child: Icon(
          obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          size: 24,
          color: mainBlack60,
        ),
      ),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // onChanged: (value) => _runFilter(value, home),
  );
}

CupertinoTextField inputPasswordWithSvgIcon(TextEditingController inputController,
    String label, bool obscureText, void Function() toggle,  {String icon = ''}) {
  return CupertinoTextField(
    // focusNode: _focusNode,
    textInputAction: TextInputAction.next,
    controller: inputController,
    obscureText: obscureText,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(16)),
    placeholder: label,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16,
        color: mainBlack60,
        fontWeight: FontWeight.normal,
        letterSpacing: 1),
    prefix: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SvgPicture.asset(
        icon,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(mainBlack60, BlendMode.srcIn),
      ),
    ),
    suffix: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: GestureDetector(
        onTap: toggle,
        child: Icon(
          obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          size: 24,
          color: mainBlack60,
        ),
      ),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // onChanged: (value) => _runFilter(value, home),
  );
}

CupertinoTextField inputTextMnemonic(TextEditingController inputController,
    String index, mnemonicPhrasesRandom) {
  return CupertinoTextField(
    textInputAction: TextInputAction.next,
    controller: inputController,
    placeholder: mnemonicPhrasesRandom,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(10)),
    style: const TextStyle(
        fontSize: 14,
        fontFamily: 'Montserrat',
        color: mainBlack60,
        fontWeight: FontWeight.w700,
        letterSpacing: 1),
    prefix: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Text('$index.',
          style:
              const TextStyle(color: mainBlack60, fontWeight: FontWeight.w700)),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // onChanged: (value) => _runFilter(value, home),
  );
}

CupertinoSearchTextField inputSearch(TextEditingController inputController,
    String label, Function searchInputChange, MainProvider mainProvider) {
  return CupertinoSearchTextField(
    controller: inputController,
    decoration: BoxDecoration(
        color: mainBlack5, borderRadius: BorderRadius.circular(16)),
    placeholder: label,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        color: mainBlack60,
        fontWeight: FontWeight.w400,
        letterSpacing: 1),
    prefixIcon: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SvgPicture.asset('assets/icons/Search.svg',
          colorFilter: const ColorFilter.mode(mainBlack60, BlendMode.srcIn)),
    ),
    placeholderStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    onChanged: (value) => searchInputChange(value, mainProvider),
  );
}
