// To parse this JSON data, do
//
//     final programs = programsFromMap(jsonString);

import 'dart:convert';

class Programs {
  Programs({
    required this.name,
    required this.desc,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  String desc;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Programs.fromJson(String str) => Programs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Programs.fromMap(Map<String, dynamic> json) => Programs(
        name: json["name"],
        desc: json["desc"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "desc": desc,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
