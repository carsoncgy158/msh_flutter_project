import 'dart:convert';
import 'package:meta/meta.dart';

NetworkResponseEntity networkResponseEntityFromJson(String str) =>
    NetworkResponseEntity.fromJson(json.decode(str));

String networkResponseEntityToJson(NetworkResponseEntity data) =>
    json.encode(data.toJson());

class NetworkResponseEntity {
  NetworkResponseEntity({
    this.results,
  });

  List<NetworkResult> results;

  factory NetworkResponseEntity.fromJson(Map<String, dynamic> json) =>
      NetworkResponseEntity(
        results: json["results"] == null
            ? null
            : List<NetworkResult>.from(
                json["results"].map((x) => NetworkResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class NetworkResult {
  NetworkResult({
    this.role,
    this.isUniversity,
    this.email,
    this.munid,
    this.updatedAt,
    this.objectId,
    this.username,
    this.createdAt,
    this.establishedTime,
    this.likes,
    this.nameZh,
    this.emailVerified,
    this.avatar,
    this.mobilePhoneVerified,
    this.phone,
    this.gender,
    this.nameEn,
  });

  String role;
  bool isUniversity;
  String email;
  bool munid;
  DateTime updatedAt;
  String objectId;
  String username;
  DateTime createdAt;
  String establishedTime;
  int likes;
  String nameZh;
  bool emailVerified;
  String avatar;
  bool mobilePhoneVerified;
  String phone;
  String gender;
  String nameEn;

  factory NetworkResult.fromJson(Map<String, dynamic> json) => NetworkResult(
        role: json["role"] == null ? null : json["role"],
        isUniversity:
            json["is_university"] == null ? null : json["is_university"],
        email: json["email"] == null ? null : json["email"],
        munid: json["munid"] == null ? null : json["munid"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        objectId: json["objectId"] == null ? null : json["objectId"],
        username: json["username"] == null ? null : json["username"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        establishedTime:
            json["established_time"] == null ? null : json["established_time"],
        likes: json["likes"] == null ? null : json["likes"],
        nameZh: json["name_zh"] == null ? null : json["name_zh"],
        emailVerified:
            json["emailVerified"] == null ? null : json["emailVerified"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        mobilePhoneVerified: json["mobilePhoneVerified"] == null
            ? null
            : json["mobilePhoneVerified"],
        phone: json["phone"] == null ? null : json["phone"],
        gender: json["gender"] == null ? null : json["gender"],
        nameEn: json["name_en"] == null ? null : json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "is_university": isUniversity == null ? null : isUniversity,
        "email": email == null ? null : email,
        "munid": munid == null ? null : munid,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "objectId": objectId == null ? null : objectId,
        "username": username == null ? null : username,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "established_time": establishedTime == null ? null : establishedTime,
        "likes": likes == null ? null : likes,
        "name_zh": nameZh == null ? null : nameZh,
        "emailVerified": emailVerified == null ? null : emailVerified,
        "avatar": avatar == null ? null : avatar,
        "mobilePhoneVerified":
            mobilePhoneVerified == null ? null : mobilePhoneVerified,
        "phone": phone == null ? null : phone,
        "gender": gender == null ? null : gender,
        "name_en": nameEn == null ? null : nameEn,
      };
}

// To parse this JSON data, do
//
//     final followeeResponseEntity = followeeResponseEntityFromJson(jsonString);

FolloweeResponseEntity followeeResponseEntityFromJson(String str) =>
    FolloweeResponseEntity.fromJson(json.decode(str));

String followeeResponseEntityToJson(FolloweeResponseEntity data) =>
    json.encode(data.toJson());

class FolloweeResponseEntity {
  FolloweeResponseEntity({
    this.results,
  });

  List<FolloweeResult> results;

  factory FolloweeResponseEntity.fromJson(Map<String, dynamic> json) =>
      FolloweeResponseEntity(
        results: json["results"] == null
            ? null
            : List<FolloweeResult>.from(
                json["results"].map((x) => FolloweeResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class FolloweeResult {
  FolloweeResult({
    this.user,
    this.followee,
    this.createdAt,
    this.updatedAt,
    this.objectId,
  });

  FolloweeUser user;
  Followee followee;
  DateTime createdAt;
  DateTime updatedAt;
  String objectId;

  factory FolloweeResult.fromJson(Map<String, dynamic> json) => FolloweeResult(
        user: json["user"] == null ? null : FolloweeUser.fromJson(json["user"]),
        followee: json["followee"] == null
            ? null
            : Followee.fromJson(json["followee"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        objectId: json["objectId"] == null ? null : json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "followee": followee == null ? null : followee.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "objectId": objectId == null ? null : objectId,
      };
}

class Followee {
  Followee({
    this.role,
    this.isUniversity,
    this.email,
    this.munid,
    this.updatedAt,
    this.acl,
    this.phone,
    this.objectId,
    this.username,
    this.createdAt,
    this.establishedTime,
    this.likes,
    this.className,
    this.nameZh,
    this.emailVerified,
    this.qq,
    this.type,
    this.avatar,
    this.munYear,
    this.gender,
    this.location,
    this.mobilePhoneVerified,
    this.birthday,
    this.nameEn,
    this.wechat,
  });

  String role;
  bool isUniversity;
  String email;
  bool munid;
  DateTime updatedAt;
  FolloweeAcl acl;
  String phone;
  String objectId;
  String username;
  DateTime createdAt;
  String establishedTime;
  int likes;
  String className;
  String nameZh;
  bool emailVerified;
  String qq;
  String type;
  String avatar;
  String munYear;
  String gender;
  String location;
  bool mobilePhoneVerified;
  DateTime birthday;
  String nameEn;
  String wechat;

  factory Followee.fromJson(Map<String, dynamic> json) => Followee(
        role: json["role"] == null ? null : json["role"],
        isUniversity:
            json["is_university"] == null ? null : json["is_university"],
        email: json["email"] == null ? null : json["email"],
        munid: json["munid"] == null ? null : json["munid"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        acl: json["ACL"] == null ? null : FolloweeAcl.fromJson(json["ACL"]),
        phone: json["phone"] == null ? null : json["phone"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        username: json["username"] == null ? null : json["username"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        establishedTime:
            json["established_time"] == null ? null : json["established_time"],
        likes: json["likes"] == null ? null : json["likes"],
        className: json["className"] == null ? null : json["className"],
        nameZh: json["name_zh"] == null ? null : json["name_zh"],
        emailVerified:
            json["emailVerified"] == null ? null : json["emailVerified"],
        qq: json["qq"] == null ? null : json["qq"],
        type: json["__type"] == null ? null : json["__type"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        munYear: json["mun_year"] == null ? null : json["mun_year"],
        gender: json["gender"] == null ? null : json["gender"],
        location: json["location"] == null ? null : json["location"],
        mobilePhoneVerified: json["mobilePhoneVerified"] == null
            ? null
            : json["mobilePhoneVerified"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        nameEn: json["name_en"] == null ? null : json["name_en"],
        wechat: json["wechat"] == null ? null : json["wechat"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "is_university": isUniversity == null ? null : isUniversity,
        "email": email == null ? null : email,
        "munid": munid == null ? null : munid,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "ACL": acl == null ? null : acl.toJson(),
        "phone": phone == null ? null : phone,
        "objectId": objectId == null ? null : objectId,
        "username": username == null ? null : username,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "established_time": establishedTime == null ? null : establishedTime,
        "likes": likes == null ? null : likes,
        "className": className == null ? null : className,
        "name_zh": nameZh == null ? null : nameZh,
        "emailVerified": emailVerified == null ? null : emailVerified,
        "qq": qq == null ? null : qq,
        "__type": type == null ? null : type,
        "avatar": avatar == null ? null : avatar,
        "mun_year": munYear == null ? null : munYear,
        "gender": gender == null ? null : gender,
        "location": location == null ? null : location,
        "mobilePhoneVerified":
            mobilePhoneVerified == null ? null : mobilePhoneVerified,
        "birthday": birthday == null
            ? null
            : "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "name_en": nameEn == null ? null : nameEn,
        "wechat": wechat == null ? null : wechat,
      };
}

class FolloweeAcl {
  FolloweeAcl({
    this.empty,
  });

  FolloweeEmpty empty;

  factory FolloweeAcl.fromJson(Map<String, dynamic> json) => FolloweeAcl(
        empty: json["*"] == null ? null : FolloweeEmpty.fromJson(json["*"]),
      );

  Map<String, dynamic> toJson() => {
        "*": empty == null ? null : empty.toJson(),
      };
}

class FolloweeEmpty {
  FolloweeEmpty({
    this.write,
    this.read,
  });

  bool write;
  bool read;

  factory FolloweeEmpty.fromJson(Map<String, dynamic> json) => FolloweeEmpty(
        write: json["write"] == null ? null : json["write"],
        read: json["read"] == null ? null : json["read"],
      );

  Map<String, dynamic> toJson() => {
        "write": write == null ? null : write,
        "read": read == null ? null : read,
      };
}

class FolloweeUser {
  FolloweeUser({
    this.type,
    this.className,
    this.objectId,
  });

  String type;
  String className;
  String objectId;

  factory FolloweeUser.fromJson(Map<String, dynamic> json) => FolloweeUser(
        type: json["__type"] == null ? null : json["__type"],
        className: json["className"] == null ? null : json["className"],
        objectId: json["objectId"] == null ? null : json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type == null ? null : type,
        "className": className == null ? null : className,
        "objectId": objectId == null ? null : objectId,
      };
}
