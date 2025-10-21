import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';
import 'package:desafio_rickandmorty/ui/core/themes/extensions.dart';
import 'package:desafio_rickandmorty/ui/core/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final CharacterModel character;
  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 450),
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                character.imageUrl,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Center(
                      child: CustomCircularProgress(),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Text(
                character.name,
                style: context.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text('Informações', style: context.textTheme.titleLarge?.copyWith(color: Colors.black54)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text('Espécie: ${character.species}', style: context.textTheme.bodyMedium),
                      Text('Status: ${character.status}', style: context.textTheme.bodyMedium),
                      Text('Gênero: ${character.gender}', style: context.textTheme.bodyMedium),
                      Text('Origem: ${character.origin.name}', style: context.textTheme.bodyMedium),
                      Text('Localização: ${character.location.name}', style: context.textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
