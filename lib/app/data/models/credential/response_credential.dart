import 'dart:convert';
import 'data_credential.dart';

ResponseCredential responseCredentialFromJson(String str) =>
    ResponseCredential.fromJson(json.decode(str));

String responseCredentialToJson(ResponseCredential data) =>
    json.encode(data.toJson());

class ResponseCredential {
  String message;
  Data? data;
  bool status;

  ResponseCredential({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ResponseCredential.fromJson(Map<String, dynamic> json) =>
      ResponseCredential(
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        // ignore: prefer_null_aware_operators
        "data": data != null ? data!.toJson() : null,
        "status": status,
      };
}
