import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lighter_app/core/constants/colors.dart';
import 'package:lighter_app/cubit/light_cubit.dart';

class LighterScreen extends StatelessWidget {
  const LighterScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    return BlocProvider(
      create: (_) => LightCubit(),  
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
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
        body: BlocListener<LightCubit, LightState>(
          listener: (context, state) {
            if (state is LightOff) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Light is OFF')),
              );
            } else if (state is LightOn) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Light is ON')),
              );
            }
          },
          child: Center(
            child: BlocBuilder<LightCubit, LightState>(
              builder: (context, state) {
                if (state is LightOff) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 100,
                        color: AppColor.black,
                      ),
                      const SizedBox(height: 40),
                      MaterialButton(
                        minWidth: 120,
                        height: 50,
                        onPressed: () {
                          context.read<LightCubit>().toggleLight();  
                        },
                        color: AppColor.green,
                        child: Text(
                          'On',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is LightOn) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb,
                        size: 100,
                        color: AppColor.amber,
                      ),
                      const SizedBox(height: 40),
                      MaterialButton(
                        minWidth: 120,
                        height: 50,
                        onPressed: () {
                          context.read<LightCubit>().toggleLight(); // التبديل بين الحالة
                        },
                        color: AppColor.red,
                        child: Text(
                          'Off',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container(); // حالة افتراضية لا شيء
              },
            ),
          ),
        ),
      ),
    );
  }
}
