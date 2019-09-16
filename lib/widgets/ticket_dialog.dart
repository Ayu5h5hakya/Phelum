import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phelum/model/booking.dart';

class TicketDialog extends StatelessWidget {
  final Booking booking;
  Function onConfirmationClicked;

  TicketDialog(
      {@required this.booking,@required this.onConfirmationClicked});

  @override
  Widget build(BuildContext context) => Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      );

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        cardContent(context),
      ],
    );
  }

  Widget avatarContent(BuildContext context) => Positioned(
        left: 16.0,
        right: 16.0,
        child: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          radius: 66.0,
        ),
      );

  Widget cardContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            booking.movieName,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
          Text(
            booking.movieGenre,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            booking.rating.toString(),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Cinemas",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            booking.cinemaName,
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Date | Time",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            "${booking.movieDate} | ${booking.movieTime}",
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Seats",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            booking.seats,
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ticket ID",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                  ),
                  Text(
                    "QFX 9899 AYUSH 6152",
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Price",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
                  ),
                  Text(
                    "\$${booking.price}",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirmationClicked();
              },
            ),
          )
        ],
      ),
    );
  }
}
