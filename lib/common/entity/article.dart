import 'dart:convert';

ArticleRequestEntity articleRequestEntityFromJson(String str) =>
    ArticleRequestEntity.fromJson(json.decode(str));

String articleRequestEntityToJson(ArticleRequestEntity data) =>
    json.encode(data.toJson());

class ArticleRequestEntity {
  ArticleRequestEntity({
    this.draft,
  });

  bool draft;

  factory ArticleRequestEntity.fromJson(Map<String, dynamic> json) =>
      ArticleRequestEntity(
        draft: json["draft"],
      );

  Map<String, dynamic> toJson() => {
        "draft": draft,
      };
}

// To parse this JSON data, do
//
//     final articleResponseEntity = articleResponseEntityFromJson(jsonString);

ArticleResponseEntity articleResponseEntityFromJson(String str) =>
    ArticleResponseEntity.fromJson(json.decode(str));

String articleResponseEntityToJson(ArticleResponseEntity data) =>
    json.encode(data.toJson());

class ArticleResponseEntity {
  ArticleResponseEntity({
    this.results,
  });

  List<ArticleResult> results;

  factory ArticleResponseEntity.fromJson(Map<String, dynamic> json) =>
      ArticleResponseEntity(
        results: List<ArticleResult>.from(
            json["results"].map((x) => ArticleResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ArticleResult {
  ArticleResult({
    this.dependent,
    this.createdAt,
    this.updatedAt,
    this.write,
    this.draft,
    this.cover,
    this.objectId,
  });

  ArticleDependent dependent;
  DateTime createdAt;
  DateTime updatedAt;
  Write write;
  bool draft;
  String cover;
  String objectId;

  factory ArticleResult.fromJson(Map<String, dynamic> json) => ArticleResult(
        dependent: ArticleDependent.fromJson(json["dependent"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        write: json["write"] == null ? null : Write.fromJson(json["write"]),
        draft: json["draft"] == null ? null : json["draft"],
        cover: json["cover"] == null ? null : json["cover"],
        objectId: json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "dependent": dependent.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "write": write == null ? null : write.toJson(),
        "draft": draft == null ? null : draft,
        "cover": cover == null ? null : cover,
        "objectId": objectId,
      };
}

class Write {
  Write({
    this.tags,
    this.title,
    this.body,
  });

  List<String> tags;
  String title;
  String body;

  factory Write.fromJson(Map<String, dynamic> json) => Write(
        tags: List<String>.from(json["tags"].map((x) => x)),
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "title": title,
        "body": body,
      };
}

class ArticleDependent {
  ArticleDependent({
    this.type,
    this.className,
    this.objectId,
  });

  String type;
  String className;
  String objectId;

  factory ArticleDependent.fromJson(Map<String, dynamic> json) =>
      ArticleDependent(
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
