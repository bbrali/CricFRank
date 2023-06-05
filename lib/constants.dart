import 'package:flutter/material.dart';

const kAppTitleTextStyle = TextStyle(
  color: Color(0xDDFFFFFF),
  fontSize: 60.0,
  fontFamily: 'Kumar One Outline',
  fontWeight: FontWeight.w600,
  letterSpacing: 2.0,
);

const kCredentialsInputFieldDecoration = InputDecoration(
  isDense: true,
  filled: true,
  fillColor: Color(0x55FFFFFF),
  hintText: 'Type your email...',
  hintStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x550097A7),
    ),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0x55FFFFFF),
    ),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const kScreensBackgroundContainerDecoration = BoxDecoration(
  gradient: SweepGradient(
    center: Alignment.topRight,
    stops: [0.3, 1.0],
    colors: <Color>[Color(0xFFB2EBF2), Color(0xFFFF5722)],
  ),
//        image: DecorationImage(
//          image: AssetImage('images/home_screen_background.png'),
//          alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeatX,
//          fit: BoxFit.contain,
//        ),
);

const TextStyle kUserGreetingsTextStyle = TextStyle(
  color: Color(0xEEFFFFFF),
);

const kHomeScreenPlayerRankTextStyle = TextStyle(
  color: Color(0x440097A7),
  fontSize: 60.0,
  fontFamily: 'Kumar One',
);

const kHomeScreen1stRankPlayerNameTextStyle = TextStyle(
  color: Color(0xBBFFFFFF),
  fontSize: 30.0,
  shadows: <Shadow>[
    Shadow(
      color: Color(0xFF0097A7),
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
    ),
  ],
  //fontFamily: 'Kumar One Outline',
);

const kContentContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
  ),
);

const kHomeCardPlayerNameTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Color(0x440097A7),
  fontFamily: 'Kumar One Outline',
  letterSpacing: 2.0,
);

const kExitButtonColour = Color(0xFFFF5722);

const kSearchPlayerTextFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xFF0097A7),
    width: 3.0,
  ),
);

const kSearchPlayerTextFieldHintTextStyle = TextStyle(
  fontSize: 14.0,
  color: Color(0xAABDBDBD),
  fontFamily: 'Kumar One',
);

const kVoteButtonDecoration = BoxDecoration(
  color: Color(0xFF00BCD4),
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: Colors.grey,
      offset: Offset(3.0, 3.0),
      spreadRadius: 1.0,
      blurRadius: 4.0,
    ),
  ],
);

const kButtonTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 23.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Kumar One',
);

const kBackNavigationButtonDecoration = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: Colors.black38,
      offset: Offset(2.0, 2.0),
      spreadRadius: 1.0,
      blurRadius: 3.0,
    ),
  ],
);

const kPlayerProfileRankTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 40.0,
  fontFamily: 'Kumar One',
);

const kPlayerProfileCardPlayerNameTextStyle = TextStyle(
  color: Color(0xAA0097A7),
  fontFamily: 'Kumar One Outline',
  letterSpacing: 2.0,
);

const kPlayerProfileCardPlayerCountryNameTextStyle = TextStyle(
  color: Colors.black45,
  fontSize: 22.0,
  fontFamily: 'Kumar One',
  letterSpacing: -0.5,
);

const kPlayerProfileItemHeadingTextStyle = TextStyle(
  color: Color(0xBB000000),
  fontSize: 12.0,
);

const kIccRankingFormatTextStyle = TextStyle(
  color: Colors.black38,
  fontSize: 12.0,
);

const kIccRankingContainerDecoration = BoxDecoration(
  color: Color(0x77B2EBF2),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const kIccRankingRankTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 20.0,
);

const kPlayerProfileOtherItemsContainerDecoration = BoxDecoration(
  color: Color(0x11BDBDBD),
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);

const kPlayerProfileOtherItemsTextStyle = TextStyle(
  color: Color(0x880097A7),
  letterSpacing: 2.0,
);
