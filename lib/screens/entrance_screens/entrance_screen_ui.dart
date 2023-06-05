/// ### WE'VE RESOLVED AN IMPORTANT ISSUE IN THIS FILE/SCREEN. PLEASE, SEE END(BOTTOM) OF THE FILE. ###

import 'package:flutter/material.dart';
import 'package:cricf_rank/constants.dart';
import 'package:cricf_rank/components/buttons/login_button.dart';

class EntranceScreenUI extends StatelessWidget {
  final double logoIconWidth;
  final double logoIconHeight;
  final Color titleAnimatedColour;
  final String passwordHintText;
  final Function onEmailChanged;
  final Function onPasswordChanged;
  final String buttonText;
  final Function onButtonPress;
  final Function onRegisterButtonPress;
  final bool isLoginScreen;
  EntranceScreenUI(
      {this.logoIconWidth = 160.0,
      this.logoIconHeight = 160.0,
      this.titleAnimatedColour,
      this.passwordHintText = 'Enter your password',
      @required this.buttonText,
      @required this.onEmailChanged,
      @required this.onPasswordChanged,
      @required this.isLoginScreen,
      @required this.onButtonPress,
      this.onRegisterButtonPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: Alignment.topRight,
          stops: [0.3, 1.0],
          colors: <Color>[Color(0xBBB2EBF2), Color(0xBBFF5722)],
        ),

//        gradient: LinearGradient(
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter,
//          colors: <Color>[Color(0xFF0097A7), Colors.white],
//        ),
//        image: DecorationImage(
//          image: AssetImage('images/app_basics/login_register_background.png'),
//          alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeat,
//          fit: BoxFit.fill,
//          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.dstIn),
//        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text.rich(
                      TextSpan(
                        text: 'Cric',
                        style: kAppTitleTextStyle.copyWith(color: titleAnimatedColour),
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' f ',
                            style: kAppTitleTextStyle.copyWith(
                              color: Color(0xFFFF5722),
                            ),
                          ),
                          TextSpan(
                            text: 'Rank',
                            style: kAppTitleTextStyle.copyWith(color: titleAnimatedColour),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: Image.asset(
                    'images/app_basics/app_icon.png',
                    width: logoIconWidth,
                    height: logoIconHeight,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFFFF5722),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Color(0xFFFF5722),
                    textAlign: TextAlign.center,
                    decoration: kCredentialsInputFieldDecoration,
                    onChanged: onEmailChanged,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFFFF5722),
                    ),
                    cursorColor: Color(0xFFFF5722),
                    obscureText: true,
                    obscuringCharacter: '*',
                    textAlign: TextAlign.center,
                    decoration: kCredentialsInputFieldDecoration.copyWith(
                      hintText: passwordHintText,
                    ),
                    onChanged: onPasswordChanged,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: LoginButton(
                    buttonText: buttonText,
                    onPress: onButtonPress,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: isLoginScreen
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                'images/app_basics/sign_in.png',
                                color: Color(0x55FFFFFF),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0, right: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: FittedBox(
                                        child: Text(
                                          'Not a Member Yet?',
                                          style: TextStyle(
                                            color: Color(0xFFFF5722),
                                            fontFamily: 'Kumar One',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: onRegisterButtonPress,
                                        child: FittedBox(
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Image.asset(
                          'images/app_basics/sign_up.png',
                          color: Color(0x770097A7),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ### NOTE: 1 Issue regarding layout we had after first 6 modules(i.e: overflow issue in (landscape)orientation) is we still have. WE'LL LOOK FOR IT BY OURSELVES.
/// SOLUTION: 1st, thing to do is to use 'Expanded' widget. Divide screen in points and use 'flex' factor accordingly(NOTE: In our Future Apps Mock-up Designing we'll use 'Ruler/Scale' for measuring & every part of our Screen/UI will have a calculated height and width-> So, that we're able to set our 'flex' factor values accordingly :-) ), greater the flex values for expanded widgets more accurate crafting you have.(For example: in this screen we considered approx. 550.0 points height in total. So after top margin we divided 48 points as flex values for our Expanded widgets.).
///   // Now, this almost SOLVED our problem except one thing, which is that we still has hard-coded font size points for our 'Text' Widgets & in landscape oreintation the text doesn't show up completely bcz of less height. (((Another issue regarding layout that we had was the use of 'Expanded' Widget, without further knowing the cause of it,
///       // To handle this, 2nd thing we did is used Flutter 'FittedBox' widget. Which simple scale and position it's child widget within itself according to 'fit' property. So, we simple wrapped our 'Text' widget wherever we had this issue and boom!!! we solved our problem.

/// /// NOW, ALLHAMDULILLAH! WE DON'T HAVE ANY ISSUE REGARDING LAYING OUT OUR UI. TEST IT/PLAY WITH IT FOR HOURS or AS MUCH AS YOU WANT.
///  ///  // TESTED ON SIMULATOR(Iphone SE) & ON ANDROID(6.5 inch screen-size) AS WELL. IT WORKS PERFECT FOR ALL ORIENTATION; IT DOESN'T OVERFLOW; IT DOESN'T OVERLAP; FOR ANY SCREEN SIZE, ANY ORIENTATION & ON-SCREEN KEYBOARD AS WELL. :-) :-) :-)
/// => AND THE TWO SAVIOURS ARE 'Expanded' Widget(with 'flex' property) & 'FittedBox' Widget(with 'fit' and 'alignment' property).
/// => PRACTICE THIS FOR ALL YOUR SCREENS, in this app.
