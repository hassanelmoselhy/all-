import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  final String btnTitle;
  final Color btnTitleColor;
  final Color btnColor;
  final void Function()? btnFunc;

  const CalcBtn({
    super.key,
    required this.btnTitle,
    required this.btnTitleColor,
    required this.btnColor,
    required this.btnFunc
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnFunc,
      child: Container(
        decoration: BoxDecoration(
        color: btnColor,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        )
        ),
        child: Center(
          child: Text(
            btnTitle,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: btnTitleColor
            ),
          ),
        ),
      ),
    );
  }
}
