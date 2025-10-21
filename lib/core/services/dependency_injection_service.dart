import 'package:desafio_rickandmorty/core/services/api_client_service.dart';
import 'package:desafio_rickandmorty/data/repositories/character_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectDependencies() async {
  await getIt.reset();

  getIt.registerLazySingleton(() => ApiClientService());
  getIt.registerLazySingleton(() => CharacterRepository(apiClient: getIt<ApiClientService>()));
}
