import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant/Colors/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {required this.value, required this.onChanged, super.key});
  final RxBool value;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          onChanged?.call(!value.value);
        },
        child: Container(
          height: 15.h,
          width: 15.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: white, width: 1.w),
          ),
          child: value.value
              ? Center(
                  child: Icon(
                    Icons.check,
                    size: 14.sp,
                    color: white,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
