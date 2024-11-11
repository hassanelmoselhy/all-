part of 'points_cubit.dart';

abstract class PointsState {
  final int teamAPoints;
  final int teamBPoints;

  PointsState({required this.teamAPoints, required this.teamBPoints});
}

class PointsAddState extends PointsState {
  PointsAddState({required int teamAPoints, required int teamBPoints})
      : super(teamAPoints: teamAPoints, teamBPoints: teamBPoints);
}

class PointsResetState extends PointsState {
  PointsResetState() : super(teamAPoints: 0, teamBPoints: 0);
}
