import 'package:cricf_rank/constants.dart';
import 'package:flutter/material.dart';

class BackNavigationButton extends StatelessWidget {
  final Function onClick;
  BackNavigationButton({@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: kBackNavigationButtonDecoration,
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFF0097A7),
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
