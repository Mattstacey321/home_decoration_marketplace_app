import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double size;
  final String url;
  final double borderRadius;
  final VoidCallback onTap;
  CustomAvatar({this.url, this.size = 35, this.borderRadius = 10, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: size,
          width: size,
          padding: EdgeInsets.all(5),
          child: url != null
              ? Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey, borderRadius: BorderRadius.circular(borderRadius)),
                  ),
                  errorBuilder: (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey, borderRadius: BorderRadius.circular(borderRadius)),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey, borderRadius: BorderRadius.circular(borderRadius)),
                )),
    );
  }
}
