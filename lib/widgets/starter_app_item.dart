import 'package:flutter/material.dart';
import 'package:workshop/core/constants/colors.dart';

class StarterAppItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String routesName;

  const StarterAppItem({super.key, required this.imagePath,required this.title, required this.routesName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, routesName);
      },
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
            // color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          const SizedBox(width: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, routesName);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: AppColor.white,
                size: 25,
              ),
            ),
          ),
          const SizedBox(width: 20,)
        ]),
      ),
    );
  }
}
