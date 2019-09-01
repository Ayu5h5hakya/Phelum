import 'package:flutter/material.dart';

class SeatPainter extends CustomPainter {
  final int rowCount = 9;
  final int columnCount = 13;
  bool redraw = false;
  Paint seatpaint;
  SeatPainter({this.redraw}){
    seatpaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    print('redraw occured');
    for(int i =0; i< columnCount;++i){
      for(int j = 0; j < rowCount; ++j){
        if(j == 1) continue;
        if(i == 2) continue;
        if(i == 9) continue; 
        canvas.drawRect(Rect.fromLTWH(30.0 * i, 30.0 * j, 23, 23), seatpaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return redraw != (oldDelegate as SeatPainter).redraw;
  }

  @override
  bool hitTest(Offset position) {
    redraw = !redraw;
  }
}