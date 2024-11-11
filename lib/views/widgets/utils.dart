import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

BoxDecoration decorationTop = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
  ),
  border:
      Border.all(color: Colors.black26, width: 1.0, style: BorderStyle.solid),
);

BoxDecoration decorationBottom = BoxDecoration(
  borderRadius: const BorderRadius.only(
    bottomLeft: Radius.circular(10.0),
    bottomRight: Radius.circular(10.0),
  ),
  border:
      Border.all(color: Colors.black26, width: 1.0, style: BorderStyle.solid),
);

BoxDecoration decorationMiddle = BoxDecoration(
  border:
      Border.all(color: Colors.black26, width: 1.0, style: BorderStyle.solid),
);

Widget information(String title, String content, BoxDecoration decoration) {
  return Container(
    padding: const EdgeInsets.all(7.0),
    decoration: decoration,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(title),
        ),
        Expanded(
          flex: 1,
          child: Text(content),
        )
      ],
    ),
  );
}

void showMessage(
    {String? image,
    String? type,
    required String message,
    required BuildContext context}) async {
  final snackBar = SnackBar(
    dismissDirection: DismissDirection.endToStart,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.fixed,
    duration: const Duration(seconds: 2),
    elevation: 0,
    content: Container(
      width: MediaQuery.of(context).size.width * 0.95,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getColor(type),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        if (image != null) Image.asset(image, height: 30),
        Text(
          message,
          style:
              const TextStyle(color: otherWhite, fontWeight: FontWeight.bold),
        ),
      ]),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Color getColor(String? type) {
  if (type == null) {
    return mainPrimary100;
  }

  Map<String, Color> typeErrors = {
    'success': otherSuccessDark,
    'error': otherErrorDark,
    'warning': otherWarningDark
  };

  Color? newColor = typeErrors[type];

  if (newColor == null) {
    return mainPrimary100;
  }

  return newColor;
}

Widget loadImgOrSvg(String path, {Color color = otherWhite}) {
  if (path.contains('.svg')) {
    return SvgPicture.asset(path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
  }

  return Image.asset(path, color: color);
}
