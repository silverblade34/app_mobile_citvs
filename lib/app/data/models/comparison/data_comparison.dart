import 'package:citvs/app/data/models/comparison/comparison.dart';
import 'package:citvs/app/data/models/comparison/header.dart';

class DataComparison {
  List<Comparison> comparison;
  Header header;

  DataComparison({
    required this.comparison,
    required this.header,
  });

  factory DataComparison.fromJson(Map<String, dynamic> json) => DataComparison(
        comparison: List<Comparison>.from(
            json["comparison"].map((x) => Comparison.fromJson(x))),
        header: Header.fromJson(json["header"]),
      );

  Map<String, dynamic> toJson() => {
        "comparison": List<dynamic>.from(comparison.map((x) => x.toJson())),
        "header": header.toJson(),
      };
}