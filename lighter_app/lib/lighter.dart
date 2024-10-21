// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lighter_app/core/constants/colors.dart';

class LighterScreen extends StatefulWidget {
  const LighterScreen({super.key});

  @override
  State<LighterScreen> createState() => _LighterScreenState();
}

class _LighterScreenState extends State<LighterScreen> {

  bool switchLight = false;

  void _changeLight(){
    setState(() {
      switchLight = !switchLight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            padding: const EdgeInsets.only(left: 20, top: 20),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: AppColor.black,
              ),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              switchLight ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 100,
              color: switchLight ? AppColor.amber : AppColor.black,
            ),
            const SizedBox(height: 40,),
              MaterialButton(
                minWidth: 120,
                height: 50,
                onPressed: _changeLight,
                color: switchLight ? AppColor.red : AppColor.green,
                child: Text(
                  switchLight ? 'Off' : 'On',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}