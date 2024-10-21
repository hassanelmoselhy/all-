import 'package:basket_app/core/constants/colors.dart';
import 'package:basket_app/logic/add_points.dart';
import 'package:basket_app/widgets/point_btn.dart';
import 'package:flutter/material.dart';

class BasketApp extends StatefulWidget {
  const BasketApp({super.key});

  @override
  State<BasketApp> createState() => _BasketAppState();
}

class _BasketAppState extends State<BasketApp> {
  AddPoints addPoints = AddPoints();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Team A',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      AddPoints.teamAPoints.toString(),
                      style: const TextStyle(
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          PointBtn(
                            btnTitle: 'Add 1 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addOnePoint('A');
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PointBtn(
                            btnTitle: 'Add 2 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addTwoPoint('A');
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PointBtn(
                            btnTitle: 'Add 3 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addThreePoint('A');
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Team B',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      AddPoints.teamBPoints.toString(),
                      style: const TextStyle(
                        fontSize: 150,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          PointBtn(
                            btnTitle: 'Add 1 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addOnePoint('B');
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PointBtn(
                            btnTitle: 'Add 2 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addTwoPoint('B');
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PointBtn(
                            btnTitle: 'Add 3 Point',
                            btnFunc: () {
                              setState(() {
                                addPoints.addThreePoint('B');
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                AddPoints.teamAPoints = 0;
                AddPoints.teamBPoints = 0;
              });
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
          ),
        ],
      ),
    );
  }
}
