import 'package:flutter_bloc/flutter_bloc.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsResetState()); 
  void addOnePoint(String team) {
    if (team == 'A') {
      emit(PointsAddState(teamAPoints: state.teamAPoints + 1, teamBPoints: state.teamBPoints));
    } else if (team == 'B') {
      emit(PointsAddState(teamAPoints: state.teamAPoints, teamBPoints: state.teamBPoints + 1));
    }
  }

  void addTwoPoints(String team) {
    if (team == 'A') {
      emit(PointsAddState(teamAPoints: state.teamAPoints + 2, teamBPoints: state.teamBPoints));
    } else if (team == 'B') {
      emit(PointsAddState(teamAPoints: state.teamAPoints, teamBPoints: state.teamBPoints + 2));
    }
  }

  void addThreePoints(String team) {
    if (team == 'A') {
      emit(PointsAddState(teamAPoints: state.teamAPoints + 3, teamBPoints: state.teamBPoints));
    } else if (team == 'B') {
      emit(PointsAddState(teamAPoints: state.teamAPoints, teamBPoints: state.teamBPoints + 3));
    }
  }

  void resetPoints() {
    emit(PointsResetState());
  }
}
