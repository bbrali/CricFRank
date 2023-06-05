import 'package:flutter/material.dart';
import 'package:cricf_rank/constants.dart';

class FloatingVoteButton extends StatelessWidget {
  final Function onPress;
  FloatingVoteButton({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF00BCD4),
      mini: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'V',
        style: kButtonTextStyle,
      ),
      onPressed: onPress,
    );
  }
}
