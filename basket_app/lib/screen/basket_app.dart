import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basket_app/cubit/points_cubit.dart'; 
import 'package:basket_app/core/constants/colors.dart';
import 'package:basket_app/widgets/point_btn.dart';

class BasketApp extends StatelessWidget {
  const BasketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PointsCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.basketApp,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Basketball Points Counter',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, color: AppColor.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(left: 20, top: 20),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColor.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: TeamColumn(team: 'A'),
                ),
                const SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    width: 20,
                  ),
                ),
                Expanded(
                  child: TeamColumn(team: 'B'),
                ),
              ],
            ),
            BlocListener<PointsCubit, PointsState>(
              listener: (context, state) {
                if (state is PointsResetState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Points have been reset")),
                  );
                }
              },
              child: BlocBuilder<PointsCubit, PointsState>(
                builder: (context, state) {
                  return MaterialButton(
                    onPressed: () {
                      context.read<PointsCubit>().resetPoints();
                    },
                    color: AppColor.basketApp,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamColumn extends StatelessWidget {
  final String team;

  const TeamColumn({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsCubit, PointsState>(
      builder: (context, state) {
        final teamPoints = team == 'A' ? state.teamAPoints : state.teamBPoints;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Team $team',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              teamPoints.toString(),
              style: const TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  PointBtn(
                    btnTitle: 'Add 1 Point',
                    btnFunc: () => context.read<PointsCubit>().addOnePoint(team),
                  ),
                  const SizedBox(height: 10),
                  PointBtn(
                    btnTitle: 'Add 2 Points',
                    btnFunc: () => context.read<PointsCubit>().addTwoPoints(team),
                  ),
                  const SizedBox(height: 10),
                  PointBtn(
                    btnTitle: 'Add 3 Points',
                    btnFunc: () => context.read<PointsCubit>().addThreePoints(team),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
