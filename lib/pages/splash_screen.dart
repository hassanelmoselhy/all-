// ignore_for_file: use_build_context_synchronously

import 'package:workshop/core/constants/colors.dart';
import 'package:workshop/pages/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _splashTime();
  }

  Future<void> _splashTime() async {
    await Future.delayed(const Duration(seconds: 5));
    // Navigator.pushNamed(context, RoutesName.home);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.splashScreenBG,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 63,),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/Paw1.png',
                  color: AppColor.primary,
                  // alignment: const Alignment(0, 0),
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'AIO APP',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NerkoOne-Regular',
                  fontSize: 80
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/icons/Paw2.png',
                  color: AppColor.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
