import 'package:flutter/material.dart';
import 'package:cricf_rank/constants.dart';
import 'package:cricf_rank/components/buttons/animated_vote_arrow_button.dart';

class ClickablePlayerCard extends StatelessWidget {
  final int playerRank;
  final String playerName;
  final Function onCardClick;
  final Function onUpVoteArrowClick;
  final Function onDownVoteArrowClick;
  ClickablePlayerCard({@required this.playerRank, @required this.playerName, @required this.onCardClick, @required this.onUpVoteArrowClick, @required this.onDownVoteArrowClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.1), BlendMode.srcATop),
            image: AssetImage('images/counting/$playerRank.png'),
          ),
        ),
        child: Card(
          color: Color(0x66B2EBF2),
          elevation: 5.0,
          shadowColor: Color(0x55B2EBF2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              children: [
                Align(
                  child: Image.asset(
                    'images/others/more_option.png',
                    color: Colors.white,
                    width: 40.0,
                    height: 40.0,
                  ),
                  alignment: Alignment.topRight,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      playerName,
                      style: kHomeCardPlayerNameTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedVoteArrowButton(
                        arrowLikedColour: Color(0xFF0097A7),
                        arrowDirection: 'up',
                        onVoteArrowClick: onUpVoteArrowClick,
                      ),
                      AnimatedVoteArrowButton(
                        arrowLikedColour: Color(0xFFFF5722),
                        arrowDirection: 'down',
                        onVoteArrowClick: onDownVoteArrowClick,
                      ),
                    ],
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
