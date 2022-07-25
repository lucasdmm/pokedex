import '../models/filter_item.dart';

class FilterMenuItems {
  static List<FilterItem> filterItems = [
    kanto,
    jhoto,
    hoenn,
    sinnoh,
    unova,
    kalos,
    alola,
    galar
  ];

  static FilterItem kanto = FilterItem(
      text: 'kanto', image: 'images/pk_location.png', value: '1' /*[0, 150]*/);
  static FilterItem jhoto = FilterItem(
      text: 'jhoto',
      image: 'images/pk_location.png',
      value: '2' /*[151, 251]*/);
  static FilterItem hoenn = FilterItem(
      text: 'hoenn',
      image: 'images/pk_location.png',
      value: '3' /*[252, 387]*/);
  static FilterItem sinnoh = FilterItem(
      text: 'sinnoh',
      image: 'images/pk_location.png',
      value: '4' /*[388, 495]*/);
  static FilterItem unova = FilterItem(
      text: 'unova',
      image: 'images/pk_location.png',
      value: '5' /*[496, 652]*/);
  static FilterItem kalos = FilterItem(
      text: 'kalos',
      image: 'images/pk_location.png',
      value: '6' /*[653, 725]*/);
  static FilterItem alola = FilterItem(
      text: 'alola',
      image: 'images/pk_location.png',
      value: '7' /*[726, 814]*/);
  static FilterItem galar = FilterItem(
      text: 'galar',
      image: 'images/pk_location.png',
      value: '8' /*[815, 904]*/);
  static FilterItem allGenerations = FilterItem(
      text: 'All Generations',
      image: 'images/pk_location.png',
      value: '' /*[0, 904]*/);
}
