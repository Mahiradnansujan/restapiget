// To parse this JSON data, do
//
//     final mahirData = mahirDataFromJson(jsonString);

import 'dart:convert';

List<MahirData> mahirDataFromJson(String str) => List<MahirData>.from(json.decode(str).map((x) => MahirData.fromJson(x)));

String mahirDataToJson(List<MahirData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MahirData {
    MahirData({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory MahirData.fromJson(Map<String, dynamic> json) => MahirData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
