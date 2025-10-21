import 'package:desafio_rickandmorty/domain/enums/character/status_character_enum.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_location_model.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_origin_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final StatusCharacterEnum status;
  final String species;
  final String type;
  final String gender;
  final CharacterOriginModel origin;
  final CharacterLocationModel location;
  final String imageUrl;
  final List<String> episodes;
  final String url;
  final DateTime createdAt;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.imageUrl,
    required this.episodes,
    required this.url,
    required this.createdAt,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: StatusCharacterEnum.values.byName(json['status'].toString().toLowerCase()),
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: CharacterOriginModel.fromJson(json['origin']),
      location: CharacterLocationModel.fromJson(json['location']),
      imageUrl: json['image'],
      episodes: List<String>.from(json['episode']),
      url: json['url'],
      createdAt: DateTime.parse(json['created']),
    );
  }
}
