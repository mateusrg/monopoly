import 'package:flutter/material.dart';

class CircleAvatarWithBorder extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final Color backgroundColor;
  final Widget child;

  const CircleAvatarWithBorder({
    required this.radius,
    required this.borderWidth,
    required this.borderColor,
    required this.backgroundColor,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: CircleAvatar(
        radius: radius - borderWidth,
        backgroundColor: backgroundColor,
        child: child,
      ),
    );
  }
}
