import 'package:desafio_rickandmorty/domain/enums/character/status_character_enum.dart';
import 'package:desafio_rickandmorty/domain/models/character/character_model.dart';
import 'package:desafio_rickandmorty/ui/core/themes/extensions.dart';
import 'package:desafio_rickandmorty/ui/core/themes/theme_colors.dart';
import 'package:desafio_rickandmorty/ui/core/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  final VoidCallback? onTap;
  const CharacterCard({super.key, required this.character, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xFFD4D4D8),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  character.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: CustomCircularProgress(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: context.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2),
                    Text(
                      character.species,
                      style: context.textTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2),
                    status(context: context, status: character.status),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 24,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget status({required BuildContext context, required StatusCharacterEnum status}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        status.descripton,
        style: context.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
