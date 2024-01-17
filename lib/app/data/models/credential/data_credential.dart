class Data {
    String token;
    int id;
    String username;
    String password;
    String rol;
    bool status;
    DateTime createdAt;

    Data({
        required this.token,
        required this.id,
        required this.username,
        required this.password,
        required this.rol,
        required this.status,
        required this.createdAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
        username: json["username"],
        password: json["password"],
        rol: json["rol"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "username": username,
        "password": password,
        "rol": rol,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
    };
}
