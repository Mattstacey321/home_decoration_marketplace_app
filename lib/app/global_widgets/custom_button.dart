import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final String tooltip;
  final double radius;
  final Color backgroundColor;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> childs;
  CustomButton({
    @required this.onTap,
    this.height = 36,
    this.width = 88,
    this.radius = 10,
    this.backgroundColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.tooltip = "",
    this.childs,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor),
                child: Row(
                  mainAxisAlignment: mainAxisAlignment,
                  mainAxisSize: MainAxisSize.max,
                  children: [for (var widget in childs ?? []) widget],
                ),
              ),Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(radius),
                      onTap: onTap != null ? () => onTap() : null,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
