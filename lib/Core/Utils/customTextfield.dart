// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/Colors/colors.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    required this.hintext,
    this.iconname,
    this.passicon,
    this.showtext,
    this.size,
    this.controller,
    this.onchanged,
    this.ontap,
    this.color,
    this.bgcolor,
    this.vlid,
    this.fontfamily,
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final String hintext;
  final String? fontfamily;

  final Icon? iconname;
  final Widget? passicon;
  final showtext;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final Color? bgcolor;
  final VoidCallback? ontap;
  String? Function(String?)? vlid;
  Function(String value)? onchanged;

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? 335.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        onTap: ontap ?? () {},
        validator: vlid,
        controller: controller,
        onChanged: onchanged,
        keyboardType: TextInputType.visiblePassword,
        obscureText: showtext ?? false,
        style: TextStyle(
            fontSize: 17.sp, fontFamily: 'Montserrat', color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: bgcolor ?? white,
          focusColor: bgcolor ?? white,
          hintText: hintext,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgcolor ?? white, width: 1.0),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgcolor ?? white, width: 1.0),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgcolor ?? white, width: 1.0),
            borderRadius: BorderRadius.circular(12.r),
          ),
          hintStyle: TextStyle(
              fontSize: size ?? 14.sp,
              color: color ?? Colors.black,
              fontFamily: fontfamily,
              fontWeight: FontWeight.w400),
          prefixIcon: iconname,
          suffixIcon: passicon,
        ),
      ),
    );
  }
}
