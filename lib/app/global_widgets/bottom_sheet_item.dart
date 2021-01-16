import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  BottomSheetItem({this.onTap, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Get.width,
        child: Row(
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2), offset: Offset(1, 2), blurRadius: 0.2)
              ]),
              child: Icon(
                icon,
                color: Colors.black,
                size: 15,
              ),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(EvaIcons.chevronRight),
          ],
        ),
      ),
    );
  }
}