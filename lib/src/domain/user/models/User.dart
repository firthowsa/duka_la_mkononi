// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'Address.dart';
import 'name.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;
  int v;

  User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    address: Address.fromJson(json["address"]),
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name.toJson(),
    "phone": phone,
    "__v": v,
  };
}



