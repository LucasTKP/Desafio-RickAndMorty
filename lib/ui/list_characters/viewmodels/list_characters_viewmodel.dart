import 'package:desafio_rickandmorty/core/services/identify_error_service.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';
import 'package:desafio_rickandmorty/data/repositories/character_repository.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CharactersViewmodels extends ChangeNotifier {
  final CharacterRepository characterRepository;

  CharactersViewmodels({required this.characterRepository});

  List<CharacterModel> characters = [];
  String? nextPageUrl = 'https://rickandmortyapi.com/api/character/?page=1';
  String? messageError;
  bool loadingCharacters = false;
  bool get hasMorePage => nextPageUrl != null;

  Future<void> loadCharacters() async {
    if (nextPageUrl == null) {
      return;
    }

    if (loadingCharacters) {
      return;
    }

    try {
      loadingCharacters = true;
      messageError = null;
      notifyListeners();
      final response = await characterRepository.fetchCharacters(url: nextPageUrl!);
      nextPageUrl = response.paginationModel.next;
      final newCharacters = response.characters;
      characters.addAll(newCharacters);
    } catch (e) {
      developer.log(e.toString());
      messageError = identifyError(error: e, message: "Erro ao buscar personagens");
    } finally {
      loadingCharacters = false;
      notifyListeners();
    }
  }
  int quantityCardsScreen(double screenSize) {
    if (screenSize > 640 && screenSize <= 1000) {
      return 2;
    } else if (screenSize > 1000 && screenSize <= 1500) {
      return 3;
    } else if (screenSize > 1500) {
      return 4;
    }
    return 1;
  }
}
