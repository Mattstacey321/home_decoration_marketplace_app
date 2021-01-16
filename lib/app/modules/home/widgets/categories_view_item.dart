import 'dart:ui';

import 'package:flutter/material.dart';

class CategorViewyItem extends StatelessWidget {
  final String image;
  final String title;
  final double height;
  final double width;
  CategorViewyItem({this.height = 100,this.width, this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), offset: Offset(0, 1), blurRadius: 0.2)
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
