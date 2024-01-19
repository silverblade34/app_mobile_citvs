
class Comparison {
  String monthName;
  double firstYear;
  double intermediateYear;
  double lastYear;

  Comparison({
    required this.monthName,
    required this.firstYear,
    required this.intermediateYear,
    required this.lastYear,
  });

  factory Comparison.fromJson(Map<String, dynamic> json) => Comparison(
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