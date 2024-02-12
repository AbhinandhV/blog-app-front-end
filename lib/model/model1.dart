// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String name;
  String phonenumber;
  String age;
  String pincode;
  String address;
  String emai;
  String password;

  Posts({
    required this.name,
    required this.phonenumber,
    required this.age,
    required this.pincode,
    required this.address,
    required this.emai,
    required this.password,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    name: json["name"],
    phonenumber: json["phonenumber"],
    age: json["age"],
    pincode: json["pincode"],
    address: json["address"],
    emai: json["emai"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phonenumber": phonenumber,
    "age": age,
    "pincode": pincode,
    "address": address,
    "emai": emai,
    "password": password,
  };
}
