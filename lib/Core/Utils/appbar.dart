import 'package:daaem_reports/Core/Utils/customButton.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant/Colors/colors.dart';
import '../Constant/Images/images.dart';
import '../Controller/controller_detail.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
        ),
        child: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            menu,
            height: 17.h,
            width: 35.84.w,
          ),
        ),
      ),
      title: CustomText(
        name: "Daaem Reports",
        size: 18.sp,
        weightFont: FontWeight.w700,
      ),
      centerTitle: true,
      actions: [
        Obx(
          () => CustomButton(
            name: "Send ",
            size: 14.sp,
            width: 65.w,
            height: 30.h,
            color:
                storingIDController.isDatabaseEmpty.value == false ? grey : red,
            ontap: () async {
              // await storingIDController.clearBoxData();
              await storingIDController.osaFtnGetingID();

              await storingIDController.stockLevelGetData();

              // Get.to(const HiveData());
            },
          ),
        ),
        10.h.pw
      ],
    );
  }
}
