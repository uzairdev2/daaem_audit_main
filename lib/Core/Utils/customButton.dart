// ignore_for_file: prefer_const_constructors_in_immutables, file_names

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constant/Colors/colors.dart';
import 'customText.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.name,
      this.height,
      this.width,
      this.color,
      this.size,
      required this.ontap,
      super.key});
  final String name;
  double? width;
  double? size;
  Color? color;
  double? height;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      onTap: ontap,
      child: Container(
        width: width ?? 343.w,
        height: height ?? 58.h,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ], color: color ?? red, borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: CustomText(
              name: name,
              size: size ?? 14.sp,
              color: white,
              familyFont: 'Montserrat',
              weightFont: FontWeight.w700),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButtonCheckBox extends StatelessWidget {
  CustomButtonCheckBox(
      {required this.name,
      this.height,
      this.width,
      this.color,
      this.size,
      required this.checkbox,
      required this.ontap,
      super.key});
  final String name;
  double? width;
  Widget checkbox;
  Color? color;
  double? height;
  double? size;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        onTap: ontap,
        child: Container(
          width: width ?? 343.w,
          height: height ?? 58.h,
          padding: EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ], color: color ?? red, borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    name: name,
                    size: size ?? 14.sp,
                    color: white,
                    familyFont: 'Montserrat',
                    weightFont: FontWeight.w700),
                10.w.pw,
                checkbox,
              ],
            ),
          ),
        ));
  }
}
