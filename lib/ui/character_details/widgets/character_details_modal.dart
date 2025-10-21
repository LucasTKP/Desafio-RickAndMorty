import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';
import 'package:desafio_rickandmorty/ui/character_details/widgets/character_details.dart';
import 'package:flutter/material.dart';

Future<void> showModalBottomSheetCharacterDetails({
  required BuildContext context,
  required CharacterModel character,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) {
      return CharacterDetails(character: character);
    },
  );
}
