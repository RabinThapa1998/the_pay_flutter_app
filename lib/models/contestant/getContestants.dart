// To parse this JSON data, do
//
//     final contestants = contestantsFromMap(jsonString);

import 'dart:convert';

class Contestants {
  Contestants({
    required this.email,
    required this.phone,
    required this.fullName,
    required this.photoUrl,
    required this.program,
    required this.payment,
    required this.age,
    required this.address,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  String email;
  String phone;
  String fullName;
  String photoUrl;
  String program;
  String payment;
  int age;
  String address;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Contestants.fromJson(String str) =>
      Contestants.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contestants.fromMap(Map<String, dynamic> json) => Contestants(
        email: json["email"],
        phone: json["phone"],
        fullName: json["full_name"],
        photoUrl: json["photo_url"],
        program: json["program"],
        payment: json["payment"],
        age: json["age"],
        address: json["address"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "phone": phone,
        "full_name": fullName,
        "photo_url": photoUrl,
        "program": program,
        "payment": payment,
        "age": age,
        "address": address,
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}
