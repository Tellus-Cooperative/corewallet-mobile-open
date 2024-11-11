class IdType {
  late String code;
  late String name;

  IdType({required this.code, required this.name});

  static List<IdType> getAll() {
    return <IdType>[
      IdType(code: "id_card", name: "Carnet de Identification"),
    ];
  }

  static IdType getIdType(String country) {
    var findCountry =
        IdType.getAll().where((element) => element.code == country);
    return findCountry.first;
  }
}
