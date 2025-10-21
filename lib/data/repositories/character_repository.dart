import 'package:desafio_rickandmorty/core/services/api_client_service.dart';
import 'package:desafio_rickandmorty/domain/models/character/response_get_all_characters_model.dart';

class CharacterRepository {
  final ApiClientService _apiClient;

  CharacterRepository({required ApiClientService apiClient}) : _apiClient = apiClient;

  Future<ResponseGetAllCharacters> fetchCharacters({required String url}) async {
    final response = await _apiClient.get(
      url: url,
      logMessage: 'Buscando personagens url:$url ',
    );

    return ResponseGetAllCharacters.fromJson(response.data);
  }
}
