
class Header {
  String monthName;
  String firstYear;
  String intermediateYear;
  String lastYear;

  Header({
    required this.monthName,
    required this.firstYear,
    required this.intermediateYear,
    required this.lastYear,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        monthName: json["monthName"],
        firstYear: json["firstYear"],
        intermediateYear: json["intermediateYear"],
        lastYear: json["lastYear"],
      );

  Map<String, dynamic> toJson() => {
        "monthName": monthName,
        "firstYear": firstYear,
        "intermediateYear": intermediateYear,
        "lastYear": lastYear,
      };
}
