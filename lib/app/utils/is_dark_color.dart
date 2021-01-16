import 'package:flutter/material.dart';

bool isDarkColor(Color color) {
  double darkness = 1 - (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
  if (darkness < 0.5) {
    return false; // It's a light color
  } else {
    return true; // It's a dark color
  }
}
