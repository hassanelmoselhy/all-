import 'package:calculator_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcLogic {
  static String calcExp = '';
  static double? calcExpSolve = 0.0;

  void btnAddExp(String btnTitle) {
    calcExp += btnTitle;
  }

  void btnCExp() {
    calcExp = '';
    calcExpSolve = 0.0;
  }

  void btnChangeSign() {
    if (calcExp.isEmpty) return;

    String lastNumber = '';
    int lastOperatorIndex = -1;

    for (int i = calcExp.length - 1; i >= 0; i--) {
      if (_isOperator(calcExp[i])) {
        lastOperatorIndex = i;
        break;
      }
    }

    if (lastOperatorIndex == -1) {
      lastNumber = calcExp;
    } else {
      lastNumber = calcExp.substring(lastOperatorIndex + 1);
    }

    if (lastNumber.startsWith('-')) {
      lastNumber = lastNumber.substring(1);
    } else {
      lastNumber = '-$lastNumber';
    }

    if (lastOperatorIndex == -1) {
      calcExp = lastNumber;
    } else {
      calcExp = calcExp.substring(0, lastOperatorIndex + 1) + lastNumber;
    }
  }

  bool _isOperator(String character) {
    return character == '+' || character == '-' || character == '*' || character == '/';
  }

  void btnDelExp() {
    if (calcExp.isNotEmpty) {
      calcExp = calcExp.substring(0, calcExp.length - 1);
    }
  }

  void solveExp() {
    Parser parser = Parser();
    String sanitizedCalcExp = calcExp.replaceAll(' ', '/ 100');
    Expression exp = parser.parse(sanitizedCalcExp);
    ContextModel contextModel = ContextModel();
    calcExpSolve = exp.evaluate(EvaluationType.REAL, contextModel);
  }

  List<String> calcBtnTitle = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'X',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  List<Color> calcBtnColorTitle = [
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.white,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.white,
    AppColor.black,
    AppColor.black,
    AppColor.black,
    AppColor.white,
    AppColor.black,
    AppColor.black,
    AppColor.white,
    AppColor.white,
  ];

  List<Color> calcBtnColor = [
    AppColor.calcBtn,
    AppColor.calcBtn,
    AppColor.calcBtn,
    AppColor.calcBtn,
    AppColor.white,
    AppColor.white,
    AppColor.white,
    AppColor.primary,
    AppColor.white,
    AppColor.white,
    AppColor.white,
    AppColor.primary,
    AppColor.white,
    AppColor.white,
    AppColor.white,
    AppColor.primary,
    AppColor.white,
    AppColor.white,
    AppColor.orange,
    AppColor.primary
  ];

  List<Function> calcBtnFunc = [
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
  ];
}
