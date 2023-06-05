import 'package:cricf_rank/screens/player_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:cricf_rank/components/cards/clickable_player_card.dart';
import 'package:cricf_rank/constants.dart';
import 'package:cricf_rank/components/buttons/floating_vote_button.dart';
import 'package:cricf_rank/components/buttons/animated_vote_arrow_button.dart';
import 'package:cricf_rank/screens/vote_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricf_rank/models/players_data.dart';

PlayersData playersData = PlayersData();

class HomeScreen extends StatefulWidget {
  static const String id = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _loggedInUser;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void getCurrentUser() {
    try {
      if (_auth.currentUser != null) {
        _loggedInUser = _auth.currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScreensBackgroundContainerDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '1st',
                                    style: kHomeScreenPlayerRankTextStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        AnimatedVoteArrowButton(
                                          arrowDirection: 'up',
                                          arrowLikedColour: Color(0xFF0097A7),
                                          onVoteArrowClick: (bool isLiked) async {
                                            _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByPosition(0)).update({'vote_points': FieldValue.increment(1)});
                                            return !isLiked;
                                          },
                                        ),
                                        AnimatedVoteArrowButton(
                                          arrowDirection: 'down',
                                          arrowLikedColour: Color(0xFFFF5722),
                                          onVoteArrowClick: (bool isLiked) async {
                                            _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByPosition(0)).update({'vote_points': FieldValue.increment(-1)});

                                            return !isLiked;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        child: StreamBuilder<QuerySnapshot>(
                                          stream: _firebaseFirestore.collection('players').orderBy('vote_points', descending: true).snapshots(),
                                          builder: (context, asyncSnapshot) {
                                            if (!asyncSnapshot.hasData) {
                                              return CircularProgressIndicator();
                                            }
                                            var players = asyncSnapshot.data.docs;
                                            playersData.setPlayersDataWithUpdatedData(players);
                                            return Text(
                                              playersData.getPlayerNameByPosition(0),
                                              style: kHomeScreen1stRankPlayerNameTextStyle,
                                            );
                                          },
                                        ),
//
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Hello! ${_loggedInUser.email.split("@")[0].toUpperCase()}',
                                    style: kUserGreetingsTextStyle,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Implement the logout Functionality.
                                      _auth.signOut();
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      color: kExitButtonColour,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: _firebaseFirestore.collection('players').orderBy('vote_points', descending: true).snapshots(),
                                builder: (context, asyncSnapshot) {
                                  if (!asyncSnapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  var data = asyncSnapshot.data;
                                  String firstRankedPlayerImageUrl = 'images/players_playing_pics/${data.docs[0].data()['name'].toString().toLowerCase()}_playing_pic.png';
                                  return Image.asset(
                                    firstRankedPlayerImageUrl,
                                    fit: BoxFit.cover,
                                  );
                                },
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
                flex: 4,
                child: Container(
                  width: double.maxFinite,
                  decoration: kContentContainerDecoration,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return StreamBuilder<QuerySnapshot>(
                          stream: _firebaseFirestore.collection('players').orderBy('vote_points', descending: true).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            var players = snapshot.data.docs;
                            playersData.setPlayersDataWithUpdatedData(players);

                            return ClickablePlayerCard(
                              playerRank: index + 2,
                              playerName: playersData.getPlayerNameByPosition(index + 1),
                              onCardClick: () {
                                // Show Player's Profile.
                                Navigator.pushNamed(
                                  context,
                                  PlayerProfileScreen.id,
                                );
                              },
                              onUpVoteArrowClick: (bool isLiked) async {
                                _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByPosition(index + 1)).update({'vote_points': FieldValue.increment(1)});

                                return !isLiked;
                              },
                              onDownVoteArrowClick: (bool isLiked) async {
                                _firebaseFirestore.collection('players').doc(playersData.getPlayerDocumentIdByPosition(index + 1)).update({'vote_points': FieldValue.increment(-1)});

                                return !isLiked;
                              },
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.0,
                        );
                      },
                      itemCount: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingVoteButton(
          onPress: () {
            // Show the vote BottomSheet.
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => VoteScreen(),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}
