import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int? responseCode;
  String? message;

  LoginResponse({
    this.responseCode,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    responseCode: json["responseCode"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "message": message,
  };
}