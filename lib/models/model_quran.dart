// To parse this JSON data, do
//
//     final quran = quranFromJson(jsonString);

import 'dart:convert';

Map<String, List<Quran>> quranFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Quran>>(k, List<Quran>.from(v.map((x) => Quran.fromJson(x)))));

String quranToJson(Map<String, List<Quran>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Quran {
  int chapter;
  int verse;
  String text;

  Quran({
    required this.chapter,
    required this.verse,
    required this.text,
  });

  factory Quran.fromJson(Map<String, dynamic> json) => Quran(
    chapter: json["chapter"],
    verse: json["verse"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "chapter": chapter,
    "verse": verse,
    "text": text,
  };
}
