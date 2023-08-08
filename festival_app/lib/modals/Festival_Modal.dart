import 'package:flutter/foundation.dart';

class Festival {
  final String title;
  final String Network_Image;
  final List<String> Assets_Image;

  Festival(
      {required this.title,
      required this.Network_Image,
      required this.Assets_Image});

  factory Festival.frommap({required Map data}) {
    return Festival(
        title: data['title'],
        Network_Image: data['Network_image'],
        Assets_Image: data['assets_image']);
  }
}
