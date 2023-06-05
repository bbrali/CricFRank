import 'package:cricf_rank/constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  LoginButton({@required this.buttonText, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Color(0xAAFFFFFF), width: 1.5),
      ),
      child: TextButton(
        onPressed: onPress,
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            buttonText,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
