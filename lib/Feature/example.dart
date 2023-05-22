// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../Core/Constant/Colors/colors.dart';
// import '../Core/Controller/controller_detail.dart';
// import '../Core/Utils/custom_text.dart';

// class MyWidget extends StatelessWidget {
//   MyWidget({super.key});
//   final CheckController checkController = Get.put(CheckController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () async {
//                   await checkController.proFile();
//                 },
//                 child: Obx(
//                   () => checkController.imageFile.value == null
//                       ? CustomText(
//                           name: "Take a Picture",
//                           color: Colors.black,
//                           size: 12.sp,
//                           alignment: TextAlign.center,
//                           weightFont: FontWeight.w700,
//                         )
//                       : Image.file(
//                           checkController.imageFile.value!,
//                           width: 50.w,
//                           height: 50.h,
//                         ),
//                 ),
//               )
//             ]),
//       ),
//     );
//   }
// }
