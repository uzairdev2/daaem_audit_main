import 'package:daaem_reports/Core/Utils/customText.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/Colors/colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackTap;

  const CommonAppBar({Key? key, required this.title, this.onBackTap})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: onBackTap,
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
          90.w.pw,
          CustomText(
            name: title,
            size: 18.sp,
            weightFont: FontWeight.w700,
          ),
        ],
      ),
      centerTitle: true,
      leading: null,
    );
  }
}
