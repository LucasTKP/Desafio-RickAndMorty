import 'package:desafio_rickandmorty/core/services/dependency_injection_service.dart';
import 'package:desafio_rickandmorty/data/repositories/character_repository.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';
import 'package:desafio_rickandmorty/ui/core/themes/default_screen.dart';
import 'package:desafio_rickandmorty/ui/character_details/widgets/character_details_modal.dart';
import 'package:desafio_rickandmorty/ui/list_characters/viewmodels/list_characters_viewmodel.dart';
import 'package:desafio_rickandmorty/ui/list_characters/widgets/complete_loading_card.dart';
import 'package:desafio_rickandmorty/ui/list_characters/widgets/loading_card.dart';
import 'package:desafio_rickandmorty/ui/list_characters/widgets/error_card.dart';
import 'package:desafio_rickandmorty/ui/list_characters/widgets/character_card.dart';
import 'package:flutter/material.dart';

class ListCharactersScreen extends StatefulWidget {
  const ListCharactersScreen({super.key});

  @override
  State<ListCharactersScreen> createState() => _ListCharactersScreenState();
}

class _ListCharactersScreenState extends State<ListCharactersScreen> {
  late CharactersViewmodels charactersViewmodels;

  @override
  void initState() {
    super.initState();
    charactersViewmodels = CharactersViewmodels(characterRepository: getIt<CharacterRepository>());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      charactersViewmodels.loadCharacters();
    });
  }

  @override
  void dispose() {
    charactersViewmodels.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sizeScreen = MediaQuery.sizeOf(context).width;

    return DefaultScreen(
      titleAppBar: "Personagens",
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1920),
          child: AnimatedBuilder(
            animation: charactersViewmodels,
            builder: (context, _) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: charactersViewmodels.quantityCardsScreen(sizeScreen),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 120,
                ),
                itemCount: charactersViewmodels.characters.length + 1,
                itemBuilder: (context, index) {
                  if (index == charactersViewmodels.characters.length) {
                    if (charactersViewmodels.hasMorePage) {
                      if (charactersViewmodels.messageError != null) {
                        return ErrorCard(tryAgain: charactersViewmodels.loadCharacters, error: charactersViewmodels.messageError!);
                      }
                      return LoadingCard(loadMore: charactersViewmodels.loadCharacters);
                    }
                    return CompleteLoadingCard();
                  }
        
                  final character = charactersViewmodels.characters[index];
        
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: CharacterCard(
                      character: character,
                      onTap: () => onTapCharacter(character),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void onTapCharacter(CharacterModel character) {
    showModalBottomSheetCharacterDetails(context: context, character: character);
  }
}
