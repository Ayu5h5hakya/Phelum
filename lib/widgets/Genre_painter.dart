import 'package:flutter/material.dart';

class GenrePainter extends CustomPainter {
  Paint borderPaint;

  GenrePainter(){
    borderPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, 50, 25), Radius.circular(10.0)), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
  
}