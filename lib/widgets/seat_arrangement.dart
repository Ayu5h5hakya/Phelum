import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/data/seat_repository.dart';

class SeatingArrangement extends StatefulWidget {
  final int rowCount = 9;
  final int columnCount = 13;
  List<Color> colors;
  final SeatRepository seatRepository;

  SeatingArrangement([this.seatRepository]){
    colors = List.generate(rowCount * columnCount, (index){
      return Colors.blue;
    });
  }
  @override
  SeatState createState() => SeatState();
  
}

class SeatState extends State<SeatingArrangement> {

  StreamSubscription<Event> _onSeatAddedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _onSeatAddedSubscription = widget.seatRepository.seatsDB.onChildAdded.listen(_onSeatAdded);
  }

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
          widget.seatRepository.addSeat(index, 0);
        },
        );
      }),
    );
  }

  @override
  void dispose() {
    _onSeatAddedSubscription.cancel();
    super.dispose();
  }

  void _onSeatAdded(Event event) {
    setState(() {
      widget.colors[event.snapshot.value['index']] = Colors.yellow;
    });
  }
}
