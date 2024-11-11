class Country {
  late String code;
  late String name;
  late String phoneCode;
  late String flag;

  Country(
      {required this.code,
      required this.name,
      required this.phoneCode,
      required this.flag});

  static List<Country> getCountries() {
    return <Country>[
      Country(code: "CL", name: "Chile", phoneCode: '+56', flag: "cl.svg"),
      Country(code: "AR", name: "Argentina", phoneCode: '+54', flag: "ar.svg"),
      Country(code: "BO", name: "Bolivia", phoneCode: '+591', flag: "bo.svg"),
      Country(code: "BR", name: "Brasil", phoneCode: '+55', flag: "br.svg"),
      Country(code: "CO", name: "Colombia", phoneCode: '+57', flag: "co.svg"),
      Country(code: "EC", name: "Ecuador", phoneCode: '+593', flag: "ec.svg"),
      Country(code: "PY", name: "Paraguay", phoneCode: '+595', flag: "py.svg"),
      Country(code: "PE", name: "Peru", phoneCode: '+51', flag: "pe.svg"),
      Country(code: "UY", name: "Uruguay", phoneCode: '+598', flag: "uy.svg"),
      Country(code: "VE", name: "Venezuela", phoneCode: '+58', flag: "ve.svg"),
      Country(
          code: "US", name: "Estados Unidos", phoneCode: '+1', flag: "usa.svg"),
    ];
  }

  static Country getCountry(String country) {
    var findCountry =
        Country.getCountries().where((element) => element.code == country);
    return findCountry.first;
  }

  static Country getCountryFromPhoneCode(String? phoneCode) {
    if (phoneCode == null) {
      return Country.getCountries().first;
    }
    var findCountry = Country.getCountries()
        .where((element) => element.phoneCode == phoneCode);
    return findCountry.first;
  }
}
