import 'package:flutter/material.dart';
import 'package:cricf_rank/components/buttons/back_navigation_button.dart';
import 'package:cricf_rank/constants.dart';

class PlayerProfileScreen extends StatelessWidget {
  static const String id = '/player_profile_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScreensBackgroundContainerDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: BackNavigationButton(
                      onClick: () {
                        // Go Back to Home Screen.
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'images/players_profile_pics/virat kohli_profile_pic.png',
                            color: Color(0xFFFFFFFF).withOpacity(0.8),
                            colorBlendMode: BlendMode.dstIn,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '#2',
                            style: kPlayerProfileRankTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.0),
                    padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xEEFFFFFF),
                      border: Border.all(
                        color: Color(0x770097A7),
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FittedBox(
                              child: Text(
                                'Virat Kohli',
                                textScaleFactor: 2.5,
                                style: kPlayerProfileCardPlayerNameTextStyle,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              'Indian Cricketer',
                              style: kPlayerProfileCardPlayerCountryNameTextStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFBDBDBD),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'ICC Ranking:',
                                      style: kPlayerProfileItemHeadingTextStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            '1st-C',
                                            style: kIccRankingFormatTextStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FittedBox(
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: kIccRankingContainerDecoration,
                                            child: Center(
                                              child: Text(
                                                '1',
                                                style: kIccRankingRankTextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            'ODI',
                                            style: kIccRankingFormatTextStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FittedBox(
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: kIccRankingContainerDecoration,
                                            child: Center(
                                              child: Text(
                                                '3',
                                                style: kIccRankingRankTextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            'T20',
                                            style: kIccRankingFormatTextStyle,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FittedBox(
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: kIccRankingContainerDecoration,
                                            child: Center(
                                              child: Text(
                                                '6',
                                                style: kIccRankingRankTextStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Age:',
                                      textAlign: TextAlign.start,
                                      style: kPlayerProfileItemHeadingTextStyle.copyWith(
                                        fontSize: 3.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: kPlayerProfileOtherItemsContainerDecoration,
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          '26 Years',
                                          style: kPlayerProfileOtherItemsTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Best shot:',
                                      style: kPlayerProfileItemHeadingTextStyle.copyWith(
                                        fontSize: 3.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: kPlayerProfileOtherItemsContainerDecoration,
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          'Cover drive',
                                          style: kPlayerProfileOtherItemsTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Nick Name:',
                                      style: kPlayerProfileItemHeadingTextStyle.copyWith(
                                        fontSize: 8.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: kPlayerProfileOtherItemsContainerDecoration,
                                    child: Center(
                                      child: FittedBox(
                                        child: Text(
                                          'Viku',
                                          style: kPlayerProfileOtherItemsTextStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 5,
                                child: Image.asset(
                                  'images/countries_flags/india_flag.png',
                                  color: Colors.white.withOpacity(0.2),
                                  colorBlendMode: BlendMode.dstIn,
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      'images/others/more_options_horizontal.png',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
