// ignore_for_file: must_be_immutable, file_names

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/Colors/colors.dart';
import '../customButton.dart';
import '../customText.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final double containerWidth;
  final double containerHeight;
  final String option1Text;
  final String option2Text;
  final VoidCallback yesTap;
  final VoidCallback noTap;
  final VoidCallback onSubmit;
  final bool widgetTrue;
  final Widget? widget;
  Widget radio1;
  Widget radio2;

  MyAlertDialog({
    super.key,
    this.widget,
    required this.widgetTrue,
    required this.noTap,
    required this.yesTap,
    required this.title,
    required this.radio1,
    required this.radio2,
    required this.containerWidth,
    required this.containerHeight,
    required this.option1Text,
    required this.option2Text,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: CustomText(
          name: title,
          alignment: TextAlign.center,
          size: 16,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          10.h.ph,
          widgetTrue == true
              ? widget!
              : const SizedBox(
                  width: 1,
                ),
          10.h.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: yesTap,
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: aquamarine,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      5.w.pw,
                      CustomText(
                        name: option1Text,
                        size: 12.sp,
                        color: white,
                      ),
                      radio1
                    ],
                  ),
                ),
              ),
              10.w.pw,
              InkWell(
                onTap: noTap,
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      5.w.pw,
                      CustomText(
                        name: option2Text,
                        color: white,
                        size: 12.sp,
                      ),
                      radio2
                    ],
                  ),
                ),
              ),
            ],
          ),
          10.h.ph,
        ],
      ),
      actions: [
        CustomButton(
          name: "Submit",
          width: 87.w,
          height: 40.h,
          ontap: onSubmit,
        ),
      ],
    );
  }
}
