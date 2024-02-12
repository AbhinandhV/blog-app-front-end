// To parse this JSON data, do
//
//     final display = displayFromJson(jsonString);

import 'dart:convert';

List<Display> displayFromJson(String str) => List<Display>.from(json.decode(str).map((x) => Display.fromJson(x)));

String displayToJson(List<Display> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Display {
  String id;
  UserId userId;
  String post;
  DateTime? postedDate;
  int v;

  Display({
    required this.id,
    required this.userId,
    required this.post,
    required this.postedDate,
    required this.v,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
    id: json["_id"],
    userId: UserId.fromJson(json["userId"]),
    post: json["post"],
    postedDate: json["PostedDate"] == null ? null : DateTime.parse(json["PostedDate"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "post": post,
    "PostedDate": postedDate?.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  String name;
  String emai;

  UserId({
    required this.name,
    required this.emai,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    name: json["name"],
    emai: json["emai"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "emai": emai,
  };
}
