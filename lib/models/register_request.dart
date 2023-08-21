import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  String name;
  String email;
  String phone;
  String gender;
  String homePlanet;
  String spacepassNo;
  DateTime dob;
  String password;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.homePlanet,
    required this.spacepassNo,
    required this.dob,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        homePlanet: json["home_planet"],
        spacepassNo: json["spacepass_no"],
        dob: DateTime.parse(json["dob"]),
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "home_planet": homePlanet,
        "spacepass_no": spacepassNo,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "password": password,
      };
}
