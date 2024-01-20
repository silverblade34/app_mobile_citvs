import 'dart:convert';
import 'data_certificates.dart';

ResponseCertificates responseCertificatesFromJson(String str) => ResponseCertificates.fromJson(json.decode(str));

String responseCertificatesToJson(ResponseCertificates data) => json.encode(data.toJson());

class ResponseCertificates {
    String message;
    DataCertificates data;
    bool status;

    ResponseCertificates({
        required this.message,
        required this.data,
        required this.status,
    });

    factory ResponseCertificates.fromJson(Map<String, dynamic> json) => ResponseCertificates(
        message: json["message"],
        data: DataCertificates.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
    };
}

