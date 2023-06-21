// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_print

import 'package:daaem_reports/Core/API,s%20Intergartion/Login%20Api/login_api.dart';
import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_text.dart';
import 'package:daaem_reports/Core/Utils/custom_textfield.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors/colors.dart';
import '../../Core/Constant/Images/images.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  bool initialValue = false;
  String username = "";
  String password = "";
  LoginApi loginApi = LoginApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                76.h.ph,
                Image.asset(
                  logoAndname,
                  height: 94.h,
                  width: 103.w,
                ),
                47.h.ph,
                CustomText(
                  name: "Sign in",
                  size: 20.sp,
                  color: grey,
                  weightFont: FontWeight.w700,
                ),
                29.h.ph,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    name: "User name",
                    size: 14.sp,
                    weightFont: FontWeight.w700,
                  ),
                ),
                10.h.ph,
                CustomTextfield(
                  hintext: "Enter your user name",
                  onchanged: (value) {
                    username = value;
                  },
                ),
                24.h.ph,
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    name: "Password",
                    size: 14.sp,
                    weightFont: FontWeight.w700,
                  ),
                ),
                10.h.ph,
                CustomTextfield(
                  hintext: "Enter Password",
                  color: black,
                  onchanged: (value) {
                    password = value;
                  },
                ),
                5.h.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: CheckboxListTile(
                      checkColor: white,
                      tristate: false,
                      dense: true,
                      title: CustomText(
                        name: "Remember me",
                        size: 14.sp,
                        weightFont: FontWeight.w700,
                      ),
                      activeColor: Colors.transparent,
                      onChanged: (value) {},
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      value: false,
                    )),
                    CustomText(
                      name: "Forgot Password?",
                      color: red,
                      weightFont: FontWeight.w600,
                      size: 12.sp,
                    )
                  ],
                ),
                36.h.ph,
                CustomButton(
                  name: "Login",
                  ontap: () {
                    if (username != null && password != null) {
                      loginApi.loginUser(username, password);
                    }
                    // Get.toNamed(RoutesName.homeScreen);
                  },
                )
              ]),
        ),
      ),
    );
  }
}
