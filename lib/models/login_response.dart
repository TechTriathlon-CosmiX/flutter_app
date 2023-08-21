import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool loggedIn;
  String email;
  String bearerToken;

  LoginResponse({
    required this.loggedIn,
    required this.email,
    required this.bearerToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        loggedIn: json["loggedIn"],
        email: json["email"],
        bearerToken: json["bearerToken"],
      );

  Map<String, dynamic> toJson() => {
        "loggedIn": loggedIn,
        "email": email,
        "bearerToken": bearerToken,
      };
}
