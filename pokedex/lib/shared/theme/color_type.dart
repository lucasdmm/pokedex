import 'package:flutter/material.dart';

class ColorType {
  static Color? grass = const Color.fromARGB(255, 43, 156, 47);
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
  static Color? ghost = const Color.fromARGB(255, 58, 2, 154);
  static Color? steal = const Color.fromARGB(255, 101, 98, 107);
  static Color? dark = const Color.fromARGB(255, 59, 58, 62);
  static Color? fairy = const Color.fromARGB(255, 255, 168, 216);
  static Color? unknown = const Color.fromARGB(255, 82, 78, 80);
  static Color? shadow = const Color.fromARGB(255, 65, 52, 88);

  static Color getColorType(String type) {
    Color typeColor = Colors.white;
    switch (type) {
      case 'grass':
        typeColor = grass!;
        break;
      case 'steal':
        typeColor = steal!;
        break;
      case 'dark':
        typeColor = dark!;
        break;
      case 'fairy':
        typeColor = fairy!;
        break;
      case 'unknown':
        typeColor = unknown!;
        break;
      case 'shadow':
        typeColor = shadow!;
        break;
      case 'bug':
        typeColor = bug!;
        break;
      case 'flying':
        typeColor = flying!;
        break;
      case 'normal':
        typeColor = normal!;
        break;
      case 'poison':
        typeColor = poison!;
        break;
      case 'fire':
        typeColor = fire!;
        break;
      case 'water':
        typeColor = water!;
        break;
      case 'electric':
        typeColor = electric!;
        break;
      case 'psychic':
        typeColor = psychic!;
        break;
      case 'rock':
        typeColor = rock!;
        break;
      case 'ground':
        typeColor = ground!;
        break;
      case 'ice':
        typeColor = ice!;
        break;
      case 'fighting':
        typeColor = fighting!;
        break;
      case 'dragon':
        typeColor = dragon!;
        break;
      case 'ghost':
        typeColor = ghost!;
        break;
    }
    return typeColor;
  }
}
