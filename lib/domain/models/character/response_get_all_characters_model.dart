import 'package:desafio_rickandmorty/domain/models/character/pagination_model.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';

class ResponseGetAllCharacters {
  final PaginationModel paginationModel;
  final List<CharacterModel> characters;

  ResponseGetAllCharacters({
    required this.paginationModel,
    required this.characters,
  });

  factory ResponseGetAllCharacters.fromJson(Map<String, dynamic> json) {
    return ResponseGetAllCharacters(
      paginationModel: PaginationModel.fromJson(json['info']),
      characters: (json['results'] as List).map((item) => CharacterModel.fromJson(item)).toList(),
    );
  }
}
