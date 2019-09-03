import 'dart:ui';

import 'package:flutter/material.dart';

class LeftTriangleClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}