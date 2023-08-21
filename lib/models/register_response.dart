import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  int uid;
  String message;

  RegisterResponse({
    required this.uid,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        uid: json["uid"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "message": message,
      };
}
