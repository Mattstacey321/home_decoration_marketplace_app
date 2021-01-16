import 'package:flutter/material.dart';

List<Color> getProductColor(List<String> colors) {
  final colorList = <Color>[];
  for (var color in colors) {
    switch (color) {
      case "grey":
        colorList.add(Colors.grey);
        break;
      case "white":
        colorList.add(Colors.white);
        break;
      case "black":
        colorList.add(Colors.black);
        break;
      case "gold":
        colorList.add(Color(0xffFFD700));
        break;
      case "bronze":
        colorList.add(Color(0xffCD7F32));
        break;
      case "green":
        colorList.add(Colors.green);
        break;
      case "sliver":
        colorList.add(Color(0xffC0C0C0));
        break;
    }
  }
  return colorList;
}
