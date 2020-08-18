import 'dart:convert';
import 'package:meta/meta.dart';

// 登录请求
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity({
    @required this.email,
    @required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
//登录返回

UserLoginResponseEntity userLoginResponseEntityFromJson(String str) =>
    UserLoginResponseEntity.fromJson(json.decode(str));

String userLoginResponseEntityToJson(UserLoginResponseEntity data) =>
    json.encode(data.toJson());

class UserLoginResponseEntity {
  UserLoginResponseEntity({
    this.email,
    this.sessionToken,
    this.updatedAt,
    this.objectId,
    this.username,
    this.createdAt,
    this.likes,
    this.emailVerified,
    this.mobilePhoneVerified,
  });

  String email;
  String sessionToken;
  DateTime updatedAt;
  String objectId;
  String username;
  DateTime createdAt;
  int likes;
  bool emailVerified;
  bool mobilePhoneVerified;

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        email: json["email"],
        sessionToken: json["sessionToken"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        objectId: json["objectId"],
        username: json["username"],
        createdAt: DateTime.parse(json["createdAt"]),
        likes: json["likes"],
        emailVerified: json["emailVerified"],
        mobilePhoneVerified: json["mobilePhoneVerified"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "sessionToken": sessionToken,
        "updatedAt": updatedAt.toIso8601String(),
        "objectId": objectId,
        "username": username,
        "createdAt": createdAt.toIso8601String(),
        "likes": likes,
        "emailVerified": emailVerified,
        "mobilePhoneVerified": mobilePhoneVerified,
      };
}

// 注册请求
class UserSignupRequestEntity {
  String email;
  String password;

  UserSignupRequestEntity({
    @required this.email,
    @required this.password,
  });

  factory UserSignupRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserSignupRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 注册返回
UserSignupResponseEntity userSignupResponseEntityFromJson(String str) =>
    UserSignupResponseEntity.fromJson(json.decode(str));

String userSignupResponseEntityToJson(UserSignupResponseEntity data) =>
    json.encode(data.toJson());

class UserSignupResponseEntity {
  UserSignupResponseEntity({
    this.sessionToken,
    this.createdAt,
    this.objectId,
  });

  String sessionToken;
  DateTime createdAt;
  String objectId;

  factory UserSignupResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserSignupResponseEntity(
        sessionToken: json["sessionToken"],
        createdAt: DateTime.parse(json["createdAt"]),
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "sessionToken": sessionToken,
        "createdAt": createdAt.toIso8601String(),
        "objectId": objectId,
      };
}
