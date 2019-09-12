import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CinemaLocationTile extends StatefulWidget {
  const CinemaLocationTile({
    Key key,
    this.leading,
    @required this.title,
    this.subtitle,
    this.child,
    this.trailing,
  }) : super(key: key);
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget child;
  final Widget trailing;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<CinemaLocationTile> {

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: widget.leading,
            title: widget.title,
            subtitle: widget.subtitle,
            trailing: widget.trailing,
          ),
          child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => _buildChildren(context, widget.child);
}
