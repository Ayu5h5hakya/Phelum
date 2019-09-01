import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieCard extends StatelessWidget {
  String title;
  String imagePath;
  Color color;
  Function(int) onPageClicked;

  MovieCard({Key key, this.title, this.imagePath, @required this.onPageClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0)),
          child: GestureDetector(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage(imagePath),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 150,
                    child: ClipOval(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              onPageClicked(1);
            },
          ),
        ),
      ),
    );
  }
}
