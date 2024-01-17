import 'dart:convert';
import 'data_campus.dart';

ResponseCampus responseCampusFromJson(String str) => ResponseCampus.fromJson(json.decode(str));

String responseCampusToJson(ResponseCampus data) => json.encode(data.toJson());

class ResponseCampus {
    String message;
    List<Campus> data;
    bool status;

    ResponseCampus({
        required this.message,
        required this.data,
        required this.status,
    });

    factory ResponseCampus.fromJson(Map<String, dynamic> json) => ResponseCampus(
        message: json["message"],
        data: List<Campus>.from(json["data"].map((x) => Campus.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
    };
}
