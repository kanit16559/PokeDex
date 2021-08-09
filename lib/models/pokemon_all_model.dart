

// import 'dart:convert';
//
// import 'package:poke_dex/constant/constant.dart';


import 'dart:convert';

class PokemonAllModel {
  String no;
  String name;
  String url;
  String urlImage;
  PokemonAllModel({
    required this.no,
    required this.name,
    required this.url,
    required this.urlImage
  });

  factory PokemonAllModel.fromRawJson(String str) => PokemonAllModel.fromJson(json.decode(str));

  factory PokemonAllModel.fromJson(Map<String, dynamic> json) => PokemonAllModel(
    no: json["no"],
    name: json["name"],
    url: json["url"],
    urlImage: json['url_image']
  );
}