// ignore_for_file: use_key_in_widget_constructors

import 'package:calculator_app/core/constants/colors.dart';
import 'package:calculator_app/logic/calc_logic.dart';
import 'package:calculator_app/widget/calc_btn.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // const CalculatorApp({super.key});

  CalcLogic calcLogic = CalcLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 25,
            color: AppColor.white,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(left: 20),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColor.white,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          CalcLogic.calcExp,
                          style: TextStyle(
                            color: AppColor.bg,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          CalcLogic.calcExpSolve.toString(),
                          style: TextStyle(
                              color: AppColor.bg,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalcBtn(
                  btnTitle: 'C',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.calcBtn,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnCExp();
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '+/-',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.calcBtn,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnChangeSign();
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '%',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.calcBtn,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('%');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: 'DEL',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.calcBtn,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnDelExp();
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '7',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('7');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '8',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('8');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '9',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('9');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '/',
                  btnTitleColor: AppColor.white,
                  btnColor: AppColor.primary,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('/');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '4',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('4');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '5',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('5');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '6',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('6');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: 'x',
                  btnTitleColor: AppColor.white,
                  btnColor: AppColor.primary,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('*');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '1',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('1');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '2',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('2');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '3',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('3');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '-',
                  btnTitleColor: AppColor.white,
                  btnColor: AppColor.primary,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('-');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '0',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('0');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '.',
                  btnTitleColor: AppColor.black,
                  btnColor: AppColor.white,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('.');
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '=',
                  btnTitleColor: AppColor.white,
                  btnColor: AppColor.orange,
                  btnFunc: () {
                    setState(() {
                      calcLogic.solveExp();
                    });
                  },
                ),
                CalcBtn(
                  btnTitle: '+',
                  btnTitleColor: AppColor.white,
                  btnColor: AppColor.primary,
                  btnFunc: () {
                    setState(() {
                      calcLogic.btnAddExp('+');
                    });
                  },
                ),
              ],
              // itemCount: 20,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              // itemBuilder: (context, index) {
              //   return CalcBtn(btnTitle: calcLogic. , btnTitleColor: calcLogic., btnColor: Colors.white, btnFunc: setState(() {calcLogic.}),);
              // },
            ),
          )
        ],
      ),
    );
  }
}
