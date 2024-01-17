class DataTickets {
    int id;
    String name;
    String codeCampus;
    int numberOfTickets;
    int numberOfInvoices;
    double totalIncome;

    DataTickets({
        required this.id,
        required this.name,
        required this.codeCampus,
        required this.numberOfTickets,
        required this.numberOfInvoices,
        required this.totalIncome,
    });

    factory DataTickets.fromJson(Map<String, dynamic> json) => DataTickets(
        id: json["id"],
        name: json["name"],
        codeCampus: json["codeCampus"],
        numberOfTickets: json["numberOfTickets"],
        numberOfInvoices: json["numberOfInvoices"],
        totalIncome: json["totalIncome"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "codeCampus": codeCampus,
        "numberOfTickets": numberOfTickets,
        "numberOfInvoices": numberOfInvoices,
        "totalIncome": totalIncome,
    };
}
