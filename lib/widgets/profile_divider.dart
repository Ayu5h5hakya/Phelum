import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileDivider extends StatefulWidget {
  final Color color;
  final double height;
  final double thickness;

  ProfileDivider({this.color, this.height, this.thickness});

  @override
  DividerState createState() => DividerState();
}

class DividerState extends State<ProfileDivider> with TickerProviderStateMixin {
  AnimationController _widthController;
  Animation _widthAnimation;
  double _maxWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widthController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _widthAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _widthController, curve: Curves.fastOutSlowIn));
    _widthController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _maxWidth = MediaQuery.of(context).size.width / 1.5; 
    return AnimatedBuilder(
      animation: _widthController,
      builder: (context, child) {
        return SizedBox(
          height: widget.height,
          width: _widthAnimation.value * _maxWidth,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
              height: widget.thickness,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _widthController.dispose();
  }
}
