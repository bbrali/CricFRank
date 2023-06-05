import 'dart:html';

/// ### MORE UPDATE ABOUT THE IMPORTANT ISSUE WE RESOLVED IN 'ENTRANCESCREENUI' IN THIS FILE. PLEASE, SEE END(BOTTOM) OF THE FILE. ###

import 'package:flutter/material.dart';
import 'package:cricf_rank/constants.dart';
import 'package:cricf_rank/components/buttons/vote_button.dart';
import 'package:cricf_rank/components/buttons/animated_vote_arrow_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricf_rank/screens/home_screen.dart';

class VoteScreen extends StatefulWidget {
  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String selectedPlayerName = '';
  bool upVoted = false, downVoted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF757575),
      ),
      child: Container(
        decoration: kContentContainerDecoration,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 40.0,
                      color: kExitButtonColour.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(right: 40.0),
                  child: Autocomplete(
                    fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                        focusNode: focusNode,
                        controller: controller,
                        onEditingComplete: onEditingComplete,
                        style: TextStyle(
                          color: Color(0xFFFF5722),
                        ),
                        cursorColor: Color(0xFFFF5722),
                        decoration: InputDecoration(
                          icon: Image.asset(
                            'images/others/demo_player_avatar.png',
                            scale: 1.5,
                            color: Colors.white.withOpacity(0.6),
                            colorBlendMode: BlendMode.dstIn,
                          ),
                          enabledBorder: kSearchPlayerTextFieldBorder,
                          hintText: 'Type a player name...',
                          hintStyle: kSearchPlayerTextFieldHintTextStyle,
                        ),
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return [];
                      }
                      return playersData.getAllPlayersNames().where((element) => element.contains(textEditingValue.text));
                    },
                    optionsViewBuilder: (context, Function(String) onSelected, optionsList) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          List<String> actualOptionsList = optionsList.toList();
                          return Material(
                            elevation: 5.0,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            type: MaterialType.card,
                            shadowColor: Color(0x11B2EBF2),
                            child: GestureDetector(
                              onTap: () {
                                onSelected(actualOptionsList[index].toString());
                              },
                              child: Text(
                                actualOptionsList[index],
                                style: TextStyle(
                                  fontFamily: 'Kumar One',
                                  color: Color(0xAAFF5722),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: optionsList.length,
                      );
                    },
                    onSelected: (itemSelected) {
                      selectedPlayerName = itemSelected;
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 40.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedVoteArrowButton(
                        arrowLikedColour: Color(0xFF0097A7),
                        arrowDirection: 'up',
                        onVoteArrowClick: (bool isLiked) async {
                          upVoted = true;
                          return !isLiked;
                        },
                        arrowLocation: ArrowLocation.BottomSheet,
                      ),
                      AnimatedVoteArrowButton(
                        arrowLikedColour: Color(0xFFFF5722),
                        arrowDirection: 'down',
                        onVoteArrowClick: (bool isLiked) async {
                          downVoted = true;
                          return !isLiked;
                        },
                        arrowLocation: ArrowLocation.BottomSheet,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: VoteButton(
                    onPress: () {
                      // Cast the vote for the selected player.
                      upVoted
                          ? _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByName(selectedPlayerName)).update({'vote_points': FieldValue.increment(1)})
                          : _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByName(selectedPlayerName)).update({'vote_points': FieldValue.increment(-1)});
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
