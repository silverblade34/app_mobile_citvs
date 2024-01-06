// To parse this JSON data, do
//
//     final credentialUser = credentialUserFromJson(jsonString);

import 'dart:convert';

CredentialUser credentialUserFromJson(String str) =>
    CredentialUser.fromJson(json.decode(str));

String credentialUserToJson(CredentialUser data) => json.encode(data.toJson());

class CredentialUser {
  dynamic message;
  Data? data; // Ahora Data es opcional y puede ser null
  bool status;

  CredentialUser({
    required this.message,
    this.data,
    required this.status,
  });

  factory CredentialUser.fromJson(Map<String, dynamic> json) => CredentialUser(
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data":
            data != null ? data!.toJson() : null, // Cambio: manejo de data null
        "status": status,
      };
}

class Data {
  String token;
  int id;
  String username;
  String password;
  String rol;
  bool status;
  dynamic vendor;
  Company company;

  Data({
    required this.token,
    required this.id,
    required this.username,
    required this.password,
    required this.rol,
    required this.status,
    required this.vendor,
    required this.company,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
        username: json["username"],
        password: json["password"],
        rol: json["rol"],
        status: json["status"],
        vendor: json["vendor"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "username": username,
        "password": password,
        "rol": rol,
        "status": status,
        "vendor": vendor,
        "company": company.toJson(),
      };
}

class Company {
  int id;
  String name;
  String ruc;
  String phone;
  String email;
  DateTime createdAt;

  Company({
    required this.id,
    required this.name,
    required this.ruc,
    required this.phone,
    required this.email,
    required this.createdAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        ruc: json["ruc"],
        phone: json["phone"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ruc": ruc,
        "phone": phone,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
      };
}
