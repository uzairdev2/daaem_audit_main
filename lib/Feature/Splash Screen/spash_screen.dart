import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors/colors.dart';
import '../../Core/Constant/Images/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Get.offAndToNamed(RoutesName.SignIn);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [red, grey, aquamarine],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              159.h.ph,
              Image.asset(logo, height: 91.97.h, width: 91.5.w),
              32.h.ph,
              Image.asset(name, height: 38.h, width: 255.w),
              155.5.h.ph,
              Image.asset(load, height: 150.h, width: 150.w),
            ],
          ),
        ),
      ),
    );
  }
}
