class PlayersData {
  Map<String, String> _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints = {};
  List<String> _allPlayersNamesOrderedByVotePoints = [];

  /// Getters.
  List<String> getAllPlayersNames() => _allPlayersNamesOrderedByVotePoints;

  String getPlayerDocumentIdByPosition(int position) => _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints[_allPlayersNamesOrderedByVotePoints[position]];
  String getPlayerDocumentIdByName(String playerName) => _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints[playerName];
  String getPlayerNameByPosition(int position) => _allPlayersNamesOrderedByVotePoints[position];

  /// Setters.
  void setPlayersDataWithUpdatedData(var players) {
    _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints.clear();
    _allPlayersNamesOrderedByVotePoints.clear();
    for (var player in players) {
      _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints[player.data()['name']] = player.id;
    }
    _allPlayersNamesOrderedByVotePoints = _allPlayersNamesAndDocumentIdsAgainstThemOrderedByVotePoints.keys.toList();
  }
}
