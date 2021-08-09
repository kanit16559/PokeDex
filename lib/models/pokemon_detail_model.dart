// To parse this JSON data, do
//
//     final pokemonDetailModel = pokemonDetailModelFromJson(jsonString);

import 'dart:convert';

class PokemonDetailModel {
  PokemonDetailModel({
    required this.types,
    required this.stats,
  });

  List<Type> types;
  List<StatElement> stats;

  factory PokemonDetailModel.fromRawJson(String str) => PokemonDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) => PokemonDetailModel(
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    stats: List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
  };
}

class StatElement {
  StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  int baseStat;
  int effort;
  TypeClass stat;

  factory StatElement.fromRawJson(String str) => StatElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: TypeClass.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class TypeClass {
  TypeClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypeClass.fromRawJson(String str) => TypeClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  int slot;
  TypeClass type;

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: TypeClass.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}
