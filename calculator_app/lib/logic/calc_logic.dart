import 'package:calculator_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcLogic {
  static String calcExp = '';
  static double? calcExpSolve = 0.0;

  void btnAddExp(String btnTitle) {
    if (btnTitle == '%' && calcExp.isNotEmpty) {
      btnPercentage();
    } else {
      calcExp += btnTitle;
    }
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

  void btnPercentage() {
    double? lastNumber = double.tryParse(calcExp);
    if (lastNumber != null) {
      calcExp = (lastNumber / 100).toString();
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
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(calcExp);
      ContextModel contextModel = ContextModel();
      calcExpSolve = exp.evaluate(EvaluationType.REAL, contextModel);
      calcExp = calcExpSolve.toString();
    } catch (e) {
      calcExp = 'Error';
    }
  }

  // Mapping each button to a specific function
  List<String> calcBtnTitle = [
    'C', '+/-', '%', 'DEL', '7', '8', '9', '/', '4', '5', '6', '*', '1', '2', '3', '-', '0', '.', '=', '+',
  ];

  List<Color> calcBtnColorTitle = [
    AppColor.black, AppColor.black, AppColor.black, AppColor.black, AppColor.black,
    AppColor.black, AppColor.black, AppColor.white, AppColor.black, AppColor.black,
    AppColor.black, AppColor.white, AppColor.black, AppColor.black, AppColor.black,
    AppColor.white, AppColor.black, AppColor.black, AppColor.white, AppColor.white,
  ];

  List<Color> calcBtnColor = [
    AppColor.calcBtn, AppColor.calcBtn, AppColor.calcBtn, AppColor.calcBtn, AppColor.white,
    AppColor.white, AppColor.white, AppColor.primary, AppColor.white, AppColor.white,
    AppColor.white, AppColor.primary, AppColor.white, AppColor.white, AppColor.white,
    AppColor.primary, AppColor.white, AppColor.white, AppColor.orange, AppColor.primary,
  ];

  List<void Function()> calcBtnFunc() {
    return [
      btnCExp,
      btnChangeSign,
      btnPercentage,
      btnDelExp,
      () => btnAddExp('7'),
      () => btnAddExp('8'),
      () => btnAddExp('9'),
      () => btnAddExp('/'),
      () => btnAddExp('4'),
      () => btnAddExp('5'),
      () => btnAddExp('6'),
      () => btnAddExp('*'),
      () => btnAddExp('1'),
      () => btnAddExp('2'),
      () => btnAddExp('3'),
      () => btnAddExp('-'),
      () => btnAddExp('0'),
      () => btnAddExp('.'),
      solveExp,
      () => btnAddExp('+'),
    ];
  }
}
