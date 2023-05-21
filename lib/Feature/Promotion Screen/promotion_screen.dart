import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Constant/Text/text.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Controller/controller_detail.dart';
import '../../Core/Utils/checkbox.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/custom_text.dart';
import '../../Core/Utils/dropdown.dart';

// ignore: must_be_immutable
class PromotionScreen extends StatelessWidget {
  PromotionScreen({super.key});
  CommonDialog commonDialog = CommonDialog();
  List<String> countries = ['Coke', 'pepsi', 'Dew', 'Spirit', '7up'];

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
          child: Column(
            children: [
              90.h.ph,
              CustomButton(
                name: "Price Label",
                ontap: () {
                  commonDialog.showPopCustom(
                    title: priceLabelPopText,
                    btn1Name: "Yes",
                    btn2Name: "No",
                    btn1Ontap: () {},
                    btn2Ontap: () {},
                    submitOntap: () {},
                  );
                },
              ),
              39.h.ph,
              CustomButton(
                name: "Secondary place",
                ontap: () {
                  commonDialog.showPopwithCustom(
                      name: secondaryplacePopText,
                      colum: Column(
                        children: [
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
                          CustomDropdownButton(
                            hint: "Nothing selected",
                            items: countries,
                            width: 195.w,
                            size: 12.sp,
                            color: white,
                            backgroundColor: grey,
                            height: 46.h,
                            iconsizes: 24,
                            onChanged: (value) {},
                          ),
                          10.h.ph,
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: CameraWIdget(),
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
                name: "Location",
                ontap: () {
                  commonDialog.showPopCustom(
                    title: locationPopText,
                    btn1Name: "Yes",
                    btn2Name: "No",
                    btn1Ontap: () {},
                    btn2Ontap: () {},
                    submitOntap: () {
                      commonDialog.showPopCustom(
                        title: locationPopText,
                        btn1Name: "Yes",
                        btn2Name: "No",
                        btn1Ontap: () {},
                        btn2Ontap: () {},
                        submitOntap: () {},
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
