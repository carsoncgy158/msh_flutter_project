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

UserArticleResponseEntity userArticleResponseEntityFromJson(String str) =>
    UserArticleResponseEntity.fromJson(json.decode(str));

String userArticleResponseEntityToJson(UserArticleResponseEntity data) =>
    json.encode(data.toJson());

class UserArticleResponseEntity {
  UserArticleResponseEntity({
    this.role,
    this.intro,
    this.nameZh,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.objectId,
  });

  String role;
  String intro;
  String nameZh;
  String avatar;
  DateTime createdAt;
  DateTime updatedAt;
  String objectId;

  factory UserArticleResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserArticleResponseEntity(
        role: json["role"],
        intro: json["intro"],
        nameZh: json["name_zh"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "intro": intro,
        "name_zh": nameZh,
        "avatar": avatar,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "objectId": objectId,
      };
}

// To parse this JSON data, do
//
//     final userDetailResponseEntity = userDetailResponseEntityFromJson(jsonString);

/// 下面每个用户的完整信息
UserDetailResponseEntity userDetailResponseEntityFromJson(String str) =>
    UserDetailResponseEntity.fromJson(json.decode(str));

String userDetailResponseEntityToJson(UserDetailResponseEntity data) =>
    json.encode(data.toJson());

class UserDetailResponseEntity {
  UserDetailResponseEntity({
    this.role,
    this.isUniversity,
    this.email,
    this.munid,
    this.identity,
    this.updatedAt,
    this.muns,
    this.phone,
    this.affiliation,
    this.objectId,
    this.city,
    this.username,
    this.birthday,
    this.nameEn,
    this.createdAt,
    this.establishedTime,
    this.nature,
    this.likes,
    this.orgEmail,
    this.nameZh,
    this.emailVerified,
    this.qq,
    this.wechat,
    this.membersCount,
    this.mobilePhoneNumber,
    this.keyword,
    this.avatar,
    this.munYear,
    this.intro,
    this.gender,
    this.orgIdentity,
    this.location,
    this.educations,
    this.mobilePhoneVerified,
  });

  String role;
  bool isUniversity;
  String email;
  bool munid;
  String identity;
  DateTime updatedAt;
  List<Mun> muns;
  String phone;
  String affiliation;
  String objectId;
  List<String> city;
  String username;
  String birthday;
  String nameEn;
  DateTime createdAt;
  DateTime establishedTime;
  String nature;
  int likes;
  String orgEmail;
  String nameZh;
  bool emailVerified;
  String qq;
  String wechat;
  String membersCount;
  String mobilePhoneNumber;
  List<String> keyword;
  String avatar;
  String munYear;
  String intro;
  String gender;
  String orgIdentity;
  String location;
  List<Education> educations;
  bool mobilePhoneVerified;

  factory UserDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserDetailResponseEntity(
        role: json["role"] == null ? null : json["role"],
        isUniversity:
            json["is_university"] == null ? null : json["is_university"],
        email: json["email"] == null ? null : json["email"],
        munid: json["munid"] == null ? null : json["munid"],
        identity: json["identity"] == null ? null : json["identity"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        muns: json["muns"] == null
            ? null
            : List<Mun>.from(json["muns"].map((x) => Mun.fromJson(x))),
        phone: json["phone"] == null ? null : json["phone"],
        affiliation: json["affiliation"] == null ? null : json["affiliation"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        city: json["city"] == null
            ? null
            : List<String>.from(json["city"].map((x) => x)),
        username: json["username"] == null ? null : json["username"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        nameEn: json["name_en"] == null ? null : json["name_en"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        establishedTime: json["established_time"] == null
            ? null
            : DateTime.parse(json["established_time"]),
        nature: json["nature"] == null ? null : json["nature"],
        likes: json["likes"] == null ? null : json["likes"],
        orgEmail: json["orgEmail"] == null ? null : json["orgEmail"],
        nameZh: json["name_zh"] == null ? null : json["name_zh"],
        emailVerified:
            json["emailVerified"] == null ? null : json["emailVerified"],
        qq: json["qq"] == null ? null : json["qq"],
        wechat: json["wechat"] == null ? null : json["wechat"],
        membersCount:
            json["members_count"] == null ? null : json["members_count"],
        mobilePhoneNumber: json["mobilePhoneNumber"] == null
            ? null
            : json["mobilePhoneNumber"],
        keyword: json["keyword"] == null
            ? null
            : List<String>.from(json["keyword"].map((x) => x)),
        avatar: json["avatar"] == null ? null : json["avatar"],
        munYear: json["mun_year"] == null ? null : json["mun_year"],
        intro: json["intro"] == null ? null : json["intro"],
        gender: json["gender"] == null ? null : json["gender"],
        orgIdentity: json["org_identity"] == null ? null : json["org_identity"],
        location: json["location"] == null ? null : json["location"],
        educations: json["educations"] == null
            ? null
            : List<Education>.from(
                json["educations"].map((x) => Education.fromJson(x))),
        mobilePhoneVerified: json["mobilePhoneVerified"] == null
            ? null
            : json["mobilePhoneVerified"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "is_university": isUniversity == null ? null : isUniversity,
        "email": email == null ? null : email,
        "munid": munid == null ? null : munid,
        "identity": identity == null ? null : identity,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "muns": muns == null
            ? null
            : List<dynamic>.from(muns.map((x) => x.toJson())),
        "phone": phone == null ? null : phone,
        "affiliation": affiliation == null ? null : affiliation,
        "objectId": objectId == null ? null : objectId,
        "city": city == null ? null : List<dynamic>.from(city.map((x) => x)),
        "username": username == null ? null : username,
        "birthday": birthday == null ? null : birthday,
        "name_en": nameEn == null ? null : nameEn,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "established_time": establishedTime == null
            ? null
            : "${establishedTime.year.toString().padLeft(4, '0')}-${establishedTime.month.toString().padLeft(2, '0')}-${establishedTime.day.toString().padLeft(2, '0')}",
        "nature": nature == null ? null : nature,
        "likes": likes == null ? null : likes,
        "orgEmail": orgEmail == null ? null : orgEmail,
        "name_zh": nameZh == null ? null : nameZh,
        "emailVerified": emailVerified == null ? null : emailVerified,
        "qq": qq == null ? null : qq,
        "wechat": wechat == null ? null : wechat,
        "members_count": membersCount == null ? null : membersCount,
        "mobilePhoneNumber":
            mobilePhoneNumber == null ? null : mobilePhoneNumber,
        "keyword":
            keyword == null ? null : List<dynamic>.from(keyword.map((x) => x)),
        "avatar": avatar == null ? null : avatar,
        "mun_year": munYear == null ? null : munYear,
        "intro": intro == null ? null : intro,
        "gender": gender == null ? null : gender,
        "org_identity": orgIdentity == null ? null : orgIdentity,
        "location": location == null ? null : location,
        "educations": educations == null
            ? null
            : List<dynamic>.from(educations.map((x) => x.toJson())),
        "mobilePhoneVerified":
            mobilePhoneVerified == null ? null : mobilePhoneVerified,
      };
}

class Education {
  Education({
    this.schoolLevel,
    this.nameZh,
    this.nameEn,
    this.location,
    this.major,
    this.startDate,
    this.endDate,
    this.note,
  });

  String schoolLevel;
  String nameZh;
  String nameEn;
  String location;
  String major;
  String startDate;
  String endDate;
  String note;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        schoolLevel: json["school_level"] == null ? null : json["school_level"],
        nameZh: json["name_zh"] == null ? null : json["name_zh"],
        nameEn: json["name_en"] == null ? null : json["name_en"],
        location: json["location"] == null ? null : json["location"],
        major: json["major"] == null ? null : json["major"],
        startDate: json["start_date"] == null ? null : json["start_date"],
        endDate: json["end_date"] == null ? null : json["end_date"],
        note: json["note"] == null ? null : json["note"],
      );

  Map<String, dynamic> toJson() => {
        "school_level": schoolLevel == null ? null : schoolLevel,
        "name_zh": nameZh == null ? null : nameZh,
        "name_en": nameEn == null ? null : nameEn,
        "location": location == null ? null : location,
        "major": major == null ? null : major,
        "start_date": startDate == null ? null : startDate,
        "end_date": endDate == null ? null : endDate,
        "note": note == null ? null : note,
      };
}

class Mun {
  Mun({
    this.role,
    this.countryEn,
    this.award,
    this.committeeEn,
    this.nameEn,
    this.topic,
    this.organization,
    this.note,
    this.nameZh,
    this.endDate,
    this.startDate,
    this.language,
    this.countryZh,
    this.location,
    this.committeeZh,
  });

  String role;
  String countryEn;
  String award;
  String committeeEn;
  String nameEn;
  String topic;
  String organization;
  String note;
  String nameZh;
  DateTime endDate;
  DateTime startDate;
  String language;
  String countryZh;
  String location;
  String committeeZh;

  factory Mun.fromJson(Map<String, dynamic> json) => Mun(
        role: json["role"] == null ? null : json["role"],
        countryEn: json["country_en"] == null ? null : json["country_en"],
        award: json["award"] == null ? null : json["award"],
        committeeEn: json["committee_en"] == null ? null : json["committee_en"],
        nameEn: json["name_en"] == null ? null : json["name_en"],
        topic: json["topic"] == null ? null : json["topic"],
        organization:
            json["organization"] == null ? null : json["organization"],
        note: json["note"] == null ? null : json["note"],
        nameZh: json["name_zh"] == null ? null : json["name_zh"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        language: json["language"] == null ? null : json["language"],
        countryZh: json["country_zh"] == null ? null : json["country_zh"],
        location: json["location"] == null ? null : json["location"],
        committeeZh: json["committee_zh"] == null ? null : json["committee_zh"],
      );

  Map<String, dynamic> toJson() => {
        "role": role == null ? null : role,
        "country_en": countryEn == null ? null : countryEn,
        "award": award == null ? null : award,
        "committee_en": committeeEn == null ? null : committeeEn,
        "name_en": nameEn == null ? null : nameEn,
        "topic": topic == null ? null : topic,
        "organization": organization == null ? null : organization,
        "note": note == null ? null : note,
        "name_zh": nameZh == null ? null : nameZh,
        "end_date": endDate == null
            ? null
            : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "start_date": startDate == null
            ? null
            : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "language": language == null ? null : language,
        "country_zh": countryZh == null ? null : countryZh,
        "location": location == null ? null : location,
        "committee_zh": committeeZh == null ? null : committeeZh,
      };
}
