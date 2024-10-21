import 'package:basket_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PointBtn extends StatelessWidget {
  final String? btnTitle;
  final void Function()? btnFunc;

  const PointBtn({
    super.key,
    required this.btnTitle,
    required this.btnFunc
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: btnFunc,
      color: AppColor.basketApp,
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 35),
      child: Text(
        btnTitle!,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
    );
  }
}