String? validateMobile(String? value) {
  return value != null && (!isNumeric(value) || value.length < 8)
      ? 'Ingrese número de teléfono válido'
      : null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  } else {
    if (!isNumeric(value) || value.length < 5) {
      return 'Ingrese número de teléfono válido';
    }
  }
  return null;
}

bool isValidEmail(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return (regex.hasMatch(value));
}

String? validatePassword(String? value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (value != null && !regex.hasMatch(value)) {
    return '''La clave debe tener: \n
    Mínimo 1 letra mayúscula \n
    Mínimo 1 letra minúscula \n
    Mínimo 1 número''';
  } else {
    return null;
  }
}

String? validateIsEmpty(dynamic value) {
  return value == null || value == ''
      ? 'Este campo no puede estar vacío'
      : null;
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  String source = s.trim();
  return int.tryParse(source) != null;
}
