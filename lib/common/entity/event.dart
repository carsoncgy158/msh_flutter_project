// To parse this JSON data, do
//
//     final eventResponseEntity = eventResponseEntityFromJson(jsonString);

import 'dart:convert';
import 'package:mshmobile/common/entity/public.dart';

EventResponseEntity eventResponseEntityFromJson(String str) =>
    EventResponseEntity.fromJson(json.decode(str));

String eventResponseEntityToJson(EventResponseEntity data) =>
    json.encode(data.toJson());

class EventResponseEntity {
  EventResponseEntity({
    this.results,
  });

  List<Result> results;

  factory EventResponseEntity.fromJson(Map<String, dynamic> json) =>
      EventResponseEntity(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.dependent,
    this.basicInfo,
    this.createdAt,
    this.updatedAt,
    this.cover,
    this.objectId,
  });

  Dependent dependent;
  BasicInfo basicInfo;
  DateTime createdAt;
  DateTime updatedAt;
  Cover cover;
  String objectId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        dependent: Dependent.fromJson(json["dependent"]),
        basicInfo: BasicInfo.fromJson(json["basicInfo"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cover: Cover.fromJson(json["cover"]),
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "dependent": dependent.toJson(),
        "basicInfo": basicInfo.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "cover": cover.toJson(),
        "objectId": objectId,
      };
}

class BasicInfo {
  BasicInfo({
    this.dateEnd,
    this.timeStart,
    this.name,
    this.type,
    this.summary,
    this.online,
    this.timeEnd,
    this.keyword,
    this.dateStart,
    this.intro,
    this.location,
    this.contact,
  });

  DateTime dateEnd;
  String timeStart;
  String name;
  String type;
  String summary;
  String online;
  String timeEnd;
  List<String> keyword;
  DateTime dateStart;
  String intro;
  String location;
  String contact;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        dateEnd: DateTime.parse(json["date_end"]),
        timeStart: json["time_start"],
        name: json["name"],
        type: json["type"],
        summary: json["summary"],
        online: json["online"],
        timeEnd: json["time_end"],
        keyword: List<String>.from(json["keyword"].map((x) => x)),
        dateStart: DateTime.parse(json["date_start"]),
        intro: json["intro"],
        location: json["location"],
        contact: json["contact"],
      );

  Map<String, dynamic> toJson() => {
        "date_end":
            "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
        "time_start": timeStart,
        "name": name,
        "type": type,
        "summary": summary,
        "online": online,
        "time_end": timeEnd,
        "keyword": List<dynamic>.from(keyword.map((x) => x)),
        "date_start":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "intro": intro,
        "location": location,
        "contact": contact,
      };
}

class Cover {
  Cover({
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
  Acl acl;
  String name;
  String objectId;
  DateTime createdAt;
  String type;
  String url;
  String provider;
  MetaData metaData;
  String bucket;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        mimeType: json["mime_type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        key: json["key"],
        acl: Acl.fromJson(json["ACL"]),
        name: json["name"],
        objectId: json["objectId"],
        createdAt: DateTime.parse(json["createdAt"]),
        type: json["__type"],
        url: json["url"],
        provider: json["provider"],
        metaData: MetaData.fromJson(json["metaData"]),
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

class Acl {
  Acl({
    this.owner,
    this.empty,
  });

  Owner owner;
  Empty empty;

  factory Acl.fromJson(Map<String, dynamic> json) => Acl(
        owner: Owner.fromJson(json["_owner"]),
        empty: Empty.fromJson(json["*"]),
      );

  Map<String, dynamic> toJson() => {
        "_owner": owner.toJson(),
        "*": empty.toJson(),
      };
}

class Empty {
  Empty({
    this.read,
  });

  bool read;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
      };
}

class Owner {
  Owner({
    this.write,
  });

  bool write;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        write: json["write"],
      );

  Map<String, dynamic> toJson() => {
        "write": write,
      };
}

class MetaData {
  MetaData({
    this.size,
    this.owner,
  });

  int size;
  String owner;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        size: json["size"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "owner": owner,
      };
}

class Dependent {
  Dependent({
    this.type,
    this.className,
    this.objectId,
  });

  String type;
  String className;
  String objectId;

  factory Dependent.fromJson(Map<String, dynamic> json) => Dependent(
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
