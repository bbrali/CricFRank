import 'package:flutter/material.dart';
import 'package:cricf_rank/constants.dart';

class VoteButton extends StatelessWidget {
  final Function onPress;
  VoteButton({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: kVoteButtonDecoration,
      child: TextButton(
        onPressed: onPress,
        child: FittedBox(
          child: Text(
            'Vote',
            style: kButtonTextStyle.copyWith(
              fontSize: 18.0,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
