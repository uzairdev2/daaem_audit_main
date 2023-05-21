import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Constant/Text/text.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_textfield.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Controller/controller_detail.dart';
import '../../Core/Utils/checkbox.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/custom_text.dart';

// ignore: must_be_immutable
class CompetitorsScreen extends StatelessWidget {
  CompetitorsScreen({super.key});
  CommonDialog commonDialog = CommonDialog();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
            name: "Promotion",
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
                    color: aquamarine,
                    borderRadius: BorderRadius.circular(5.r)),
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
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(children: [
              90.h.ph,
              CustomButton(
                name: "Promotion",
                ontap: () {
                  commonDialog.showPopCustom(
                    btn1Ontap: () {},
                    btn2Ontap: () {},
                    submitOntap: () {},
                    color: grey,
                    btn1Name: "Regular",
                    btn2Name: "Promotional",
                    title: promotionPopText,
                  );
                },
              ),
              39.h.ph,
              CustomButton(
                name: "New item",
                ontap: () {
                  commonDialog.showPopwithCustom(
                      name: newitemPopText,
                      colum: Column(
                        children: [
                          CustomTextfield(
                            hintext: "Enter item name",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 46.h,
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter item Price",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 46.h,
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter Expiry of the item",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 46.h,
                          ),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              name: "Add a note",
                              size: 12.sp,
                              weightFont: FontWeight.w600,
                            ),
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter Expiry of the item",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 61.h,
                          ),
                          15.h.ph,
                          const CameraWIdget(),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomButton(
                              width: 87.w,
                              height: 40.h,
                              color: aquamarine,
                              name: "Submit",
                              ontap: () {},
                            ),
                          )
                        ],
                      ));
                },
              ),
              39.h.ph,
              CustomButton(
                name: "More Space",
                ontap: () {
                  commonDialog.showPopwithCustom(
                      name: moreSpacePopText,
                      colum: Column(
                        children: [
                          const CameraWIdget(),
                          15.h.ph,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              name: "Add a note",
                              size: 12.sp,
                              weightFont: FontWeight.w600,
                            ),
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter Expiry of the item",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 61.h,
                          ),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomButton(
                              width: 87.w,
                              height: 40.h,
                              color: aquamarine,
                              name: "Submit",
                              ontap: () {},
                            ),
                          )
                        ],
                      ));
                },
              ),
              39.h.ph,
              CustomButton(
                  name: "New point of sale material",
                  ontap: () {
                    commonDialog.showPopwithCustom(
                        name: newpointPopText,
                        colum: Column(children: [
                          Row(
                            children: [
                              CustomButtonCheckBox(
                                width: 90.w,
                                height: 40.h,
                                size: 12.sp,
                                color: grey,
                                checkbox: CustomCheckBox(
                                    value: checkController.yesValue),
                                name: "Gandula",
                                ontap: () {},
                              ),
                              5.w.pw,
                              CustomButtonCheckBox(
                                width: 120.w,
                                height: 40.h,
                                size: 12.sp,
                                color: grey,
                                checkbox: CustomCheckBox(
                                    value: checkController.noValue),
                                name: "Floor Display",
                                ontap: () {},
                              ),
                            ],
                          ),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              name: "Add a note",
                              size: 12.sp,
                              weightFont: FontWeight.w600,
                            ),
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter Text",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 55.h,
                          ),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              name: "Promosite",
                              size: 12.sp,
                              weightFont: FontWeight.w600,
                            ),
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter the name of promosite",
                            bgcolor: lightgrey,
                            width: 303.w,
                            height: 46.h,
                          ),
                          10.h.ph,
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: CameraWIdget(),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CustomButton(
                              width: 87.w,
                              height: 40.h,
                              color: aquamarine,
                              name: "Submit",
                              ontap: () {},
                            ),
                          )
                        ]));
                  })
            ])));
  }
}
