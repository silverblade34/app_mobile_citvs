class DataCertificates {
    int id;
    String name;
    String codeCampus;
    int approvedInspections;
    int failedInspections;
    int canceledInspections;
    int totalInspections;

    DataCertificates({
        required this.id,
        required this.name,
        required this.codeCampus,
        required this.approvedInspections,
        required this.failedInspections,
        required this.canceledInspections,
        required this.totalInspections,
    });

    factory DataCertificates.fromJson(Map<String, dynamic> json) => DataCertificates(
        id: json["id"],
        name: json["name"],
        codeCampus: json["codeCampus"],
        approvedInspections: json["approvedInspections"],
        failedInspections: json["failedInspections"],
        canceledInspections: json["canceledInspections"],
        totalInspections: json["totalInspections"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "codeCampus": codeCampus,
        "approvedInspections": approvedInspections,
        "failedInspections": failedInspections,
        "canceledInspections": canceledInspections,
        "totalInspections": totalInspections,
    };
}
