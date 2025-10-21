import 'package:flutter/material.dart';

enum StatusCharacterEnum {
  alive,
  dead,
  unknown;

  String get descripton {
    switch (this) {
      case StatusCharacterEnum.alive:
        return 'Vivo';
      case StatusCharacterEnum.dead:
        return 'Morto';
      case StatusCharacterEnum.unknown:
        return 'Desconhecido';
    }
  }

  Color get color {
    switch (this) {
      case StatusCharacterEnum.alive:
        return Colors.green;
      case StatusCharacterEnum.dead:
        return Colors.red;
      case StatusCharacterEnum.unknown:
        return Colors.grey[600] ?? Colors.grey;
    }
  }
}
