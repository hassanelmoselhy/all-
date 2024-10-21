import 'package:workshop/core/routes/routes_name.dart';
import 'package:workshop/widgets/starter_app_item.dart';
import 'package:flutter/material.dart';
import 'package:workshop/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.black,
      ),
      body: const SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StarterAppItem(imagePath: 'assets/images/icons/light.png', title: 'Lighter', routesName: RoutesName.lighterApp),
            SizedBox(height: 20,),
            StarterAppItem(imagePath: 'assets/images/icons/calculator.png', title: 'Calculator', routesName: RoutesName.calculatorApp),
            SizedBox(height: 20,),
            StarterAppItem(imagePath: 'assets/images/icons/points.png', title: 'Basket', routesName: RoutesName.basketApp),
            SizedBox(height: 20,),
            StarterAppItem(imagePath: 'assets/images/icons/game_controller.png', title: 'Tic Tac Toe', routesName: RoutesName.xoApp),
          ],
        ),
      )),
    );
  }
}
