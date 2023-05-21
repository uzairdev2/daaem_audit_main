import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/Images/images.dart';
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
    );
  }
}
