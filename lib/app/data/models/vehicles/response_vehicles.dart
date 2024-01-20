import 'dart:convert';
import 'data_vehicles.dart';

ResponseVehicles responseVehiclesFromJson(String str) =>
    ResponseVehicles.fromJson(json.decode(str));

String responseVehiclesToJson(ResponseVehicles data) =>
    json.encode(data.toJson());

class ResponseVehicles {
  String message;
  DataVehicles data;
  bool status;

  ResponseVehicles({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ResponseVehicles.fromJson(Map<String, dynamic> json) =>
      ResponseVehicles(
        message: json["message"],
        data: DataVehicles.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
      };
}
