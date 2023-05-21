import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Core/API,s Intergartion/API,s.dart';
import 'Core/Constant/Colors/colors.dart';

import 'package:provider/provider.dart';

import 'Core/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiClass()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) => GetMaterialApp(
              title: 'Daaem Audit',
              theme: ThemeData(
                useMaterial3: true,
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: backgroundColor,
              ),
              debugShowCheckedModeBanner: false,
              getPages: AppRoutes.appRoutes(),
              // home: const ScannerScreen(),
            )),
      ),
    );
  }
}
