import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/Colors/colors.dart';
import 'custom_text.dart';
import 'dropdown.dart';

// ignore: must_be_immutable
class TextDropdown extends StatelessWidget {
  TextDropdown(
      {super.key,
      required this.name,
      required this.countries,
      this.height,
      this.width,
      this.size,
      this.textColor,
      this.hint,
      this.color});

  final List<String> countries;
  String name;
  final double? width;
  final double? height;
  final double? size;
  String? hint;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          name: name,
          size: size ?? 14.sp,
          weightFont: FontWeight.w700,
          color: black,
        ),
        10.h.ph,
        CustomDropdownButton(
          hint: hint ?? "Nothing selected",
          items: countries,
          width: width ?? 343.w,
          size: 12.sp,
          color: textColor ?? black,
          backgroundColor: color ?? white,
          height: height ?? 58.h,
          iconsizes: 24,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
