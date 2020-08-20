// To parse this JSON data, do
//
//     final conferenceResponseEntity = conferenceResponseEntityFromJson(jsonString);

import 'dart:convert';

ConferenceResponseEntity conferenceResponseEntityFromJson(String str) =>
    ConferenceResponseEntity.fromJson(json.decode(str));

String conferenceResponseEntityToJson(ConferenceResponseEntity data) =>
    json.encode(data.toJson());

class ConferenceResponseEntity {
  ConferenceResponseEntity({
    this.results,
  });

  List<ConferenceResult> results;

  factory ConferenceResponseEntity.fromJson(Map<String, dynamic> json) =>
      ConferenceResponseEntity(
        results: List<ConferenceResult>.from(
            json["results"].map((x) => ConferenceResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ConferenceResult {
  ConferenceResult({
    this.recommend,
    this.updatedAt,
    this.useMunshare,
    this.objectId,
    this.cover,
    this.createdAt,
    this.isPublic,
    this.online,
    this.basicInfo,
    this.avatar,
    this.dependent,
    this.committees,
    this.teams,
    this.files,
  });

  bool recommend;
  DateTime updatedAt;
  bool useMunshare;
  String objectId;
  ConferenceCover cover;
  DateTime createdAt;
  bool isPublic;
  bool online;
  ConferenceBasicInfo basicInfo;
  ConferenceCover avatar;
  ConferenceDependent dependent;
  List<Committee> committees;
  List<Team> teams;
  List<ConferenceDependent> files;

  factory ConferenceResult.fromJson(Map<String, dynamic> json) =>
      ConferenceResult(
        recommend: json["recommend"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        useMunshare: json["useMunshare"],
        objectId: json["objectId"],
        cover: json["cover"] == null
            ? null
            : ConferenceCover.fromJson(json["cover"]),
        createdAt: DateTime.parse(json["createdAt"]),
        isPublic: json["isPublic"],
        online: json["online"],
        basicInfo: ConferenceBasicInfo.fromJson(json["basicInfo"]),
        avatar: json["avatar"] == null
            ? null
            : ConferenceCover.fromJson(json["avatar"]),
        dependent: ConferenceDependent.fromJson(json["dependent"]),
        committees: json["committees"] == null
            ? null
            : List<Committee>.from(
                json["committees"].map((x) => Committee.fromJson(x))),
        teams: json["teams"] == null
            ? null
            : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        files: json["files"] == null
            ? null
            : List<ConferenceDependent>.from(
                json["files"].map((x) => ConferenceDependent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommend": recommend,
        "updatedAt": updatedAt.toIso8601String(),
        "useMunshare": useMunshare,
        "objectId": objectId,
        "cover": cover == null ? null : cover.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "isPublic": isPublic,
        "online": online,
        "basicInfo": basicInfo.toJson(),
        "avatar": avatar == null ? null : avatar.toJson(),
        "dependent": dependent.toJson(),
        "committees": committees == null
            ? null
            : List<dynamic>.from(committees.map((x) => x.toJson())),
        "teams": teams == null
            ? null
            : List<dynamic>.from(teams.map((x) => x.toJson())),
        "files": files == null
            ? null
            : List<dynamic>.from(files.map((x) => x.toJson())),
      };
}

class ConferenceCover {
  ConferenceCover({
    this.mimeType,
    this.updatedAt,
    this.key,
    this.acl,
    this.name,
    this.objectId,
    this.createdAt,
    this.type,
    this.url,
    this.provider,
    this.metaData,
    this.bucket,
  });

  String mimeType;
  DateTime updatedAt;
  String key;
  ConferenceAcl acl;
  String name;
  String objectId;
  DateTime createdAt;
  String type;
  String url;
  String provider;
  ConferenceMetaData metaData;
  String bucket;

  factory ConferenceCover.fromJson(Map<String, dynamic> json) =>
      ConferenceCover(
        mimeType: json["mime_type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        key: json["key"],
        acl: ConferenceAcl.fromJson(json["ACL"]),
        name: json["name"],
        objectId: json["objectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        type: json["__type"],
        url: json["url"],
        provider: json["provider"],
        metaData: ConferenceMetaData.fromJson(json["metaData"]),
        bucket: json["bucket"],
      );

  Map<String, dynamic> toJson() => {
        "mime_type": mimeType,
        "updatedAt": updatedAt.toIso8601String(),
        "key": key,
        "ACL": acl.toJson(),
        "name": name,
        "objectId": objectId,
        "createdAt": createdAt.toIso8601String(),
        "__type": type,
        "url": url,
        "provider": provider,
        "metaData": metaData.toJson(),
        "bucket": bucket,
      };
}

class ConferenceAcl {
  ConferenceAcl({
    this.owner,
    this.empty,
  });

  ConferenceOwner owner;
  ConferenceEmpty empty;

  factory ConferenceAcl.fromJson(Map<String, dynamic> json) => ConferenceAcl(
        owner: ConferenceOwner.fromJson(json["_owner"]),
        empty: ConferenceEmpty.fromJson(json["*"]),
      );

  Map<String, dynamic> toJson() => {
        "_owner": owner.toJson(),
        "*": empty.toJson(),
      };
}

class ConferenceEmpty {
  ConferenceEmpty({
    this.read,
  });

  bool read;

  factory ConferenceEmpty.fromJson(Map<String, dynamic> json) =>
      ConferenceEmpty(
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
      };
}

class ConferenceOwner {
  ConferenceOwner({
    this.write,
  });

  bool write;

  factory ConferenceOwner.fromJson(Map<String, dynamic> json) =>
      ConferenceOwner(
        write: json["write"],
      );

  Map<String, dynamic> toJson() => {
        "write": write,
      };
}

class ConferenceMetaData {
  ConferenceMetaData({
    this.size,
    this.owner,
  });

  int size;
  String owner;

  factory ConferenceMetaData.fromJson(Map<String, dynamic> json) =>
      ConferenceMetaData(
        size: json["size"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "owner": owner,
      };
}

class ConferenceBasicInfo {
  ConferenceBasicInfo({
    this.dateEnd,
    this.fee,
    this.email,
    this.agrStart,
    this.signupStart,
    this.orgId,
    this.city,
    this.nameEn,
    this.organization,
    this.nameZh,
    this.theme,
    this.level,
    this.qq,
    this.wechat,
    this.keyword,
    this.dateStart,
    this.intro,
    this.agrEnd,
    this.signupEnd,
    this.location,
    this.people,
  });

  DateTime dateEnd;
  String fee;
  String email;
  String agrStart;
  String signupStart;
  String orgId;
  List<String> city;
  String nameEn;
  List<String> organization;
  String nameZh;
  String theme;
  dynamic level;
  String qq;
  String wechat;
  List<String> keyword;
  DateTime dateStart;
  String intro;
  String agrEnd;
  String signupEnd;
  String location;
  String people;

  factory ConferenceBasicInfo.fromJson(Map<String, dynamic> json) =>
      ConferenceBasicInfo(
        dateEnd: DateTime.parse(json["date_end"]),
        fee: json["fee"],
        email: json["email"],
        agrStart: json["agr_start"],
        signupStart: json["signup_start"],
        orgId: json["org_id"],
        city: List<String>.from(json["city"].map((x) => x)),
        nameEn: json["name_en"],
        organization: List<String>.from(json["organization"].map((x) => x)),
        nameZh: json["name_zh"],
        theme: json["theme"],
        level: json["level"],
        qq: json["qq"],
        wechat: json["wechat"],
        keyword: List<String>.from(json["keyword"].map((x) => x)),
        dateStart: DateTime.parse(json["date_start"]),
        intro: json["intro"],
        agrEnd: json["agr_end"],
        signupEnd: json["signup_end"],
        location: json["location"],
        people: json["people"],
      );

  Map<String, dynamic> toJson() => {
        "date_end":
            "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
        "fee": fee,
        "email": email,
        "agr_start": agrStart,
        "signup_start": signupStart,
        "org_id": orgId,
        "city": List<dynamic>.from(city.map((x) => x)),
        "name_en": nameEn,
        "organization": List<dynamic>.from(organization.map((x) => x)),
        "name_zh": nameZh,
        "theme": theme,
        "level": level,
        "qq": qq,
        "wechat": wechat,
        "keyword": List<dynamic>.from(keyword.map((x) => x)),
        "date_start":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "intro": intro,
        "agr_end": agrEnd,
        "signup_end": signupEnd,
        "location": location,
        "people": people,
      };
}

class Committee {
  Committee({
    this.nameZh,
    this.nameEn,
    this.topic,
    this.delegation,
    this.language,
    this.people,
    this.intro,
  });

  String nameZh;
  String nameEn;
  String topic;
  String delegation;
  String language;
  String people;
  String intro;

  factory Committee.fromJson(Map<String, dynamic> json) => Committee(
        nameZh: json["name_zh"],
        nameEn: json["name_en"],
        topic: json["topic"],
        delegation: json["delegation"],
        language: json["language"],
        people: json["people"],
        intro: json["intro"],
      );

  Map<String, dynamic> toJson() => {
        "name_zh": nameZh,
        "name_en": nameEn,
        "topic": topic,
        "delegation": delegation,
        "language": language,
        "people": people,
        "intro": intro,
      };
}

class ConferenceDependent {
  ConferenceDependent({
    this.type,
    this.className,
    this.objectId,
  });

  String type;
  String className;
  String objectId;

  factory ConferenceDependent.fromJson(Map<String, dynamic> json) =>
      ConferenceDependent(
        type: json["__type"],
        className: json["className"],
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "className": className,
        "objectId": objectId,
      };
}

class Team {
  Team({
    this.nameZh,
    this.nameEn,
    this.position,
    this.school,
    this.major,
    this.munshareLink,
    this.intro,
  });

  String nameZh;
  String nameEn;
  String position;
  String school;
  String major;
  String munshareLink;
  String intro;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        nameZh: json["name_zh"],
        nameEn: json["name_en"],
        position: json["position"],
        school: json["school"],
        major: json["major"],
        munshareLink: json["munshare_link"],
        intro: json["intro"],
      );

  Map<String, dynamic> toJson() => {
        "name_zh": nameZh,
        "name_en": nameEn,
        "position": position,
        "school": school,
        "major": major,
        "munshare_link": munshareLink,
        "intro": intro,
      };
}
