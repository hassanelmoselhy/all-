class AddPoints {
  static int teamAPoints = 0;
  static int teamBPoints = 0;

  void addOnePoint(String str) {
    if (str == 'A') {
        teamAPoints++;
    } else {
        teamBPoints++;
    }
  }

  void addTwoPoint(String str) {
    if (str == 'A') {
        teamAPoints+=2;
    } else {
        teamBPoints+=2;
    }
  }

  void addThreePoint(String str) {
    if (str == 'A') {
        teamAPoints+=3;
    } else {
        teamBPoints+=3;
    }
  }
}