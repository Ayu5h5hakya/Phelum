import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  TicketDialog(
      {@required this.title,
      @required this.description,
      @required this.buttonText,
      this.image});

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
            "Joker",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
          Text(
            "Crime | Drama | Thriller",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            "8.8",
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Cinemas",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            "QFX cinemas, labim mall",
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Date | Time",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            "Friday, 28 June | 12:30 PM",
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Seats",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
          ),
          Text(
            "G8, H7, H8, H9",
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
                    "\$20.0",
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
              },
            ),
          )
        ],
      ),
    );
  }
}
