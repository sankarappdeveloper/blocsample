// To parse this JSON data, do
//
//     final listresponse = listresponseFromJson(jsonString);

import 'dart:convert';

List<Listresponse> listresponseFromJson(String str) => List<Listresponse>.from(json.decode(str).map((x) => Listresponse.fromJson(x)));

String listresponseToJson(List<Listresponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listresponse {
  Listresponse({
    required this.id,
    required this.isUser,
    required this.rating,
    required this.fullName,
  });

  int id;
  bool isUser;
  String rating;
  String fullName;

  factory Listresponse.fromJson(Map<String, dynamic> json) => Listresponse(
    id: json["id"] == null ? null : json["id"],
    isUser: json["isUser"] == null ? null : json["isUser"],
    rating: json["rating"] == null ? null : json["rating"],
    fullName: json["fullName"] == null ? null : json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "isUser": isUser == null ? null : isUser,
    "rating": rating == null ? null : rating,
    "fullName": fullName == null ? null : fullName,
  };
}
