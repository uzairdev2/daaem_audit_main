import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/custom_text.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  TitleText({
    required this.title,
    super.key,
  });

  String title;
  @override
  Widget build(BuildContext context) {
    return CustomText(
      name: title,
      size: 14.sp,
      weightFont: FontWeight.w700,
    );
  }
}
