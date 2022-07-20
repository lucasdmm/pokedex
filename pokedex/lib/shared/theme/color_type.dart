import 'package:flutter/material.dart';

class ColorType {
  static Color? grass = const Color.fromARGB(255, 11, 168, 17);
  static Color? bug = const Color.fromARGB(255, 92, 255, 98);
  static Color? fire = const Color.fromARGB(255, 255, 0, 0);
  static Color? water = Colors.blue[800];
  static Color? electric = const Color.fromRGBO(253, 216, 53, 1);
  static Color? psychic = const Color.fromARGB(255, 54, 6, 62);
  static Color? poison = const Color.fromARGB(255, 106, 9, 123);
  static Color? rock = const Color.fromARGB(255, 191, 190, 190);
  static Color? flying = const Color.fromARGB(255, 168, 216, 255);
  static Color? normal = const Color.fromARGB(255, 202, 124, 95);
  static Color? ground = const Color.fromARGB(255, 143, 66, 38);
  static Color? ice = const Color.fromARGB(255, 92, 174, 242);
  static Color? fighting = const Color.fromARGB(255, 240, 96, 96);
  static Color? dragon = const Color.fromARGB(255, 3, 56, 98);

  static Color getColorType(String type) {
    Color typeColor = Colors.white;
    switch (type) {
      case 'Grass':
        typeColor = grass!;
        break;
      case 'Bug':
        typeColor = bug!;
        break;
      case 'Flying':
        typeColor = flying!;
        break;
      case 'Normal':
        typeColor = normal!;
        break;
      case 'Poison':
        typeColor = poison!;
        break;
      case 'Fire':
        typeColor = fire!;
        break;
      case 'Water':
        typeColor = water!;
        break;
      case 'Electric':
        typeColor = electric!;
        break;
      case 'Psychic':
        typeColor = psychic!;
        break;
      case 'Rock':
        typeColor = rock!;
        break;
      case 'Ground':
        typeColor = ground!;
        break;
      case 'Ice':
        typeColor = ice!;
        break;
      case 'Fighting':
        typeColor = fighting!;
        break;
      case 'Dragon':
        typeColor = dragon!;
        break;
    }
    return typeColor;
  }
}
