import 'package:flutter/material.dart';

class ProductItemPreview extends StatelessWidget {
  final String name;
  final String image;
  ProductItemPreview({@required this.image, @required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image, height: 80, width: 70, fit: BoxFit.cover),
          ),
          name == null
              ? SizedBox()
              : Flexible(
                  child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ))
        ],
      ),
    );
  }
}
