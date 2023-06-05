import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

enum ArrowLocation { Card, BottomSheet }

class AnimatedVoteArrowButton extends StatelessWidget {
  final Color arrowLikedColour;
  final String arrowDirection;
  final Function onVoteArrowClick;
  final ArrowLocation arrowLocation;

  const AnimatedVoteArrowButton({
    this.arrowLikedColour,
    @required this.arrowDirection,
    @required this.onVoteArrowClick,
    this.arrowLocation = ArrowLocation.Card,
  });

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: arrowLocation == ArrowLocation.Card ? 40.0 : 90.0,
      bubblesColor: BubblesColor(dotPrimaryColor: arrowLikedColour, dotSecondaryColor: Colors.white),
      circleColor: CircleColor(start: Colors.white, end: arrowLikedColour),
      likeBuilder: (bool isLiked) {
        return Image.asset(
          'images/others/${arrowDirection}_vote_arrow.png',
          color: isLiked
              ? arrowLikedColour
              : arrowLocation == ArrowLocation.Card
                  ? Colors.white
                  : arrowDirection == 'up'
                      ? Color(0x22B2EBF2)
                      : Color(0x11FF5722),
        );
      },
      onTap: onVoteArrowClick,
    );
  }
}
