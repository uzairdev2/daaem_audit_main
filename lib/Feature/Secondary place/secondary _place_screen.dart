// ignore_for_file: must_be_immutable

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors/colors.dart';
import '../../Core/Controller/controller_detail.dart';
import '../../Core/Utils/checkbox.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/customButton.dart';
import '../../Core/Utils/customText.dart';
import '../../Core/Utils/dropdown.dart';

class Secondaryplace extends StatelessWidget {
  Secondaryplace({super.key});

  List<String> countries = ['Coke', 'pepsi', 'Dew', 'Spirit', '7up'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          name: "Secondary place",
          size: 18.sp,
          weightFont: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 24.h),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: aquamarine, borderRadius: BorderRadius.circular(5.r)),
              child: Icon(
                Icons.arrow_back,
                color: white,
                weight: 18.w,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 15.h, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomButtonCheckBox(
                  width: 160.w,
                  height: 46.h,
                  size: 12.sp,
                  color: red,
                  checkbox: CustomCheckBox(value: checkController.checkValue2),
                  name: "Gandula",
                  ontap: () {},
                ),
                5.w.pw,
                CustomButtonCheckBox(
                  width: 160.w,
                  height: 46.h,
                  size: 12.sp,
                  color: red,
                  checkbox: CustomCheckBox(value: checkController.checkValue1),
                  name: "Floor Display",
                  ontap: () {},
                ),
              ],
            ),
            20.h.ph,
            CustomDropdownButton(
              hint: "Nothing selected",
              items: countries,
              width: 325.w,
              size: 12.sp,
              color: white,
              backgroundColor: red,
              height: 56.h,
              iconsizes: 24,
              onChanged: (value) {},
            ),
            10.h.ph,
            const Align(
              alignment: Alignment.bottomLeft,
              child: CameraWIdget(),
            ),
            20.h.ph,
            CustomButton(
              width: 320.w,
              height: 46.h,
              color: aquamarine,
              name: "Submit",
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
