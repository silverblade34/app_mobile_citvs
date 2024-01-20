
class DataVehicles {
    int id;
    String name;
    String codeCampus;
    int heavyVehicles;
    int lightVehicles;
    int minorVehicles;

    DataVehicles({
        required this.id,
        required this.name,
        required this.codeCampus,
        required this.heavyVehicles,
        required this.lightVehicles,
        required this.minorVehicles,
    });

    factory DataVehicles.fromJson(Map<String, dynamic> json) => DataVehicles(
        id: json["id"],
        name: json["name"],
        codeCampus: json["codeCampus"],
        heavyVehicles: json["heavyVehicles"],
        lightVehicles: json["lightVehicles"],
        minorVehicles: json["minorVehicles"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "codeCampus": codeCampus,
        "heavyVehicles": heavyVehicles,
        "lightVehicles": lightVehicles,
        "minorVehicles": minorVehicles,
    };
}
