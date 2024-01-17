class Company {
  int id;
  String name;
  String businessName;
  int totalInspections;
  double totalIncome;

  Company({
    required this.id,
    required this.name,
    required this.businessName,
    required this.totalInspections,
    required this.totalIncome,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        businessName: json["businessName"],
        totalInspections: json["totalInspections"],
        totalIncome: (json["totalIncome"] is int)
            ? (json["totalIncome"] as int)
                .toDouble() // Convierte de int a double si es necesario
            : json["totalIncome"], // Deja como está si ya es double
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "businessName": businessName,
        "totalInspections": totalInspections,
        "totalIncome": totalIncome,
      };
}
