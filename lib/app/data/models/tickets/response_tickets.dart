import 'dart:convert';
import 'data_tickets.dart';

ResponseTickets responseTicketsFromJson(String str) => ResponseTickets.fromJson(json.decode(str));

String responseTicketsToJson(ResponseTickets data) => json.encode(data.toJson());

class ResponseTickets {
    String message;
    DataTickets data;
    bool status;

    ResponseTickets({
        required this.message,
        required this.data,
        required this.status,
    });

    factory ResponseTickets.fromJson(Map<String, dynamic> json) => ResponseTickets(
        message: json["message"],
        data: DataTickets.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
    };
}
