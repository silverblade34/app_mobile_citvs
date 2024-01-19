import 'dart:convert';

import 'package:citvs/app/data/models/comparison/data_comparison.dart';

ResponseComparison responseComparisonFromJson(String str) =>
    ResponseComparison.fromJson(json.decode(str));

String responseComparisonToJson(ResponseComparison data) =>
    json.encode(data.toJson());

class ResponseComparison {
  String message;
  DataComparison data;
  bool status;

  ResponseComparison({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ResponseComparison.fromJson(Map<String, dynamic> json) =>
      ResponseComparison(
        message: json["message"],
        data: DataComparison.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
      };
}
