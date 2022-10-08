// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.accessToken,
    required this.tokenType,
    required this.userId,
    required this.userName,
  });

  String accessToken;
  String tokenType;
  int userId;
  String userName;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        userId: json["user_id"],
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "user_id": userId,
        "user_name": userName,
      };
}
