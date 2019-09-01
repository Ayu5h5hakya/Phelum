import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/widgets/seat_painter.dart';

class SeatingArrangement extends StatefulWidget {
  final int rowCount = 9;
  final int columnCount = 13;
  List<Color> colors;

  SeatingArrangement(){
    colors = List.generate(rowCount * columnCount, (index){
      return Colors.blue;
    });
    print(colors.elementAt(5));
  }
  @override
  SeatState createState() => SeatState();
}

class SeatState extends State<SeatingArrangement> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 13,
      children: List.generate(widget.rowCount * widget.columnCount, (index) {
        
        return GestureDetector(
          child:  Container(
          width: 10,
          height: 10,
          color: widget.colors.elementAt(index),
          margin: EdgeInsets.all(5.0),
        ),
        onTap: () {
          print(index);
          setState(() {
           widget.colors[index] = Colors.yellow; 
          });
        },
        );
      }),
    );
  }
}
