class Campus {
  int id;
  String name;
  String codeCampus;
  String codeLocal;
  String codeEntity;
  String codeMtc;
  DateTime createdAt;

  Campus({
    required this.id,
    required this.name,
    required this.codeCampus,
    required this.codeLocal,
    required this.codeEntity,
    required this.codeMtc,
    required this.createdAt,
  });

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        id: json["id"],
        name: json["name"],
        codeCampus: json["codeCampus"],
        codeLocal: json["codeLocal"],
        codeEntity: json["codeEntity"],
        codeMtc: json["codeMtc"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "codeCampus": codeCampus,
        "codeLocal": codeLocal,
        "codeEntity": codeEntity,
        "codeMtc": codeMtc,
        "createdAt": createdAt.toIso8601String(),
      };
}
