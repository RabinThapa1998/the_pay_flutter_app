// To parse this JSON data, do
//
//     final programs = programsFromMap(jsonString);

import 'dart:convert';

class Programs {
  Programs({
    required this.name,
    required this.desc,
    required this.payment_schema,
    required this.image_url,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String name;
  String desc;
  String image_url;
  List<PaymentSchema> payment_schema;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Programs.fromJson(String str) => Programs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Programs.fromMap(Map<String, dynamic> json) => Programs(
        name: json["name"],
        desc: json["desc"],
        image_url: json["image_url"],
        payment_schema: List<PaymentSchema>.from(
            json["payment_schema"].map((x) => PaymentSchema.fromMap(x))),
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "desc": desc,
        "image_url": image_url,
        "payment_schema":
            List<dynamic>.from(payment_schema.map((x) => x.toMap())),
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class PaymentSchema {
  PaymentSchema({
    required this.votes,
    required this.cost,
  });

  int votes;
  int cost;

  factory PaymentSchema.fromMap(Map<String, dynamic> json) => PaymentSchema(
        votes: json["votes"],
        cost: json["cost"],
      );

  Map<String, dynamic> toMap() => {
        "votes": votes,
        "cost": cost,
      };
}
