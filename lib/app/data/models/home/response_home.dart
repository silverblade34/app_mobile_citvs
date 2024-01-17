import 'dart:convert';
import 'company_home.dart';

ResponseHome responseHomeFromJson(String str) =>
    ResponseHome.fromJson(json.decode(str));

String responseHomeToJson(ResponseHome data) => json.encode(data.toJson());

class ResponseHome {
  String message;
  List<Company> data;
  bool status;

  ResponseHome({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ResponseHome.fromJson(Map<String, dynamic> json) => ResponseHome(
        message: json["message"],
        data: List<Company>.from(json["data"].map((x) => Company.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}


