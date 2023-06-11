// ignore_for_file: unnecessary_null_comparison

import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Constant/Text/text.dart';
import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:daaem_reports/Core/Utils/Camera%20Widget/camera_widget.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_textfield.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Controller/controller_detail.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/custom_text.dart';

// ignore: must_be_immutable
class CompetitorsScreen extends StatelessWidget {
  CompetitorsScreen({super.key});
  CommonDialog commonDialog = CommonDialog();
  String? name;
  String? price;
  String? weight;
  String? notes;
  String? discription;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
            name: "Competitor",
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
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(children: [
              90.h.ph,
              CustomButton(
                name: "Promotion",
                ontap: () {
                  Get.toNamed(RoutesName.promoScreen);
                },
              ),
              39.h.ph,
              CustomButton(
                name: "New item",
                ontap: () {
                  commonDialog.showPopwithCustom(
                      name: newitemPopText,
                      colum: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              hintext: "Enter item name",
                              bgcolor: lightgrey,
                              width: 303.w,
                              vlid: (p0) {
                                if (name!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                              onchanged: (value) {
                                name = value;
                              },
                              height: 46.h,
                            ),
                            10.h.ph,
                            CustomTextfield(
                              hintext: "Enter item Price",
                              bgcolor: lightgrey,
                              width: 303.w,
                              height: 46.h,
                              textType: TextInputType.number,
                              vlid: (p0) {
                                if (price!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                              onchanged: (value) {
                                price = value;
                              },
                            ),
                            10.h.ph,
                            CustomTextfield(
                              hintext: "Enter Weight of item",
                              bgcolor: lightgrey,
                              width: 303.w,
                              height: 46.h,
                              vlid: (p0) {
                                if (weight!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                              onchanged: (value) {
                                weight = value;
                              },
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
                              hintext: "Enter Discription of the item",
                              bgcolor: lightgrey,
                              vlid: (p0) {
                                if (discription!.isEmpty) {
                                  return 'Please enter a value';
                                }
                                return null;
                              },
                              onchanged: (value) {
                                discription = value;
                              },
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
                                ontap: () {
                                  if (name != null &&
                                      price != null &&
                                      weight != null &&
                                      discription != null &&
                                      _formKey.currentState!.validate()) {
                                    newItemController.newItemFtnStoringID(
                                        name, price, weight, discription);
                                    Get.back();
                                    Get.snackbar(
                                        "Successfully", "Data has been saved",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: aquamarine);
                                  } else {
                                    Get.back();
                                    Get.snackbar(
                                        "Please", "Enter Data in textfield",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: aquamarine);
                                  }
                                  {}
                                },
                              ),
                            )
                          ],
                        ),
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
                          15.h.ph,
                          CameraWidget(
                            containerWidth: 70.w,
                            containerHeight: 70.h,
                            imagePath: imageContoller.moreSpaceimageFile,
                            showImage: imageContoller.moreSpaceValue,
                            onTap: () {
                              imageContoller.moreSpaceImage();
                            },
                          ),
                          10.h.ph,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CustomText(
                              name: "Add a Note",
                              size: 12.sp,
                              weightFont: FontWeight.w600,
                            ),
                          ),
                          10.h.ph,
                          CustomTextfield(
                            hintext: "Enter Note",
                            bgcolor: lightgrey,
                            width: 303.w,
                            onchanged: (value) {
                              notes = value;
                            },
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
                              ontap: () {
                                if (imageContoller.moreSpaceimageFile.value !=
                                        null &&
                                    notes != null) {
                                  moreSpaceController
                                      .moreSpaceFtnStoringID(notes);
                                  Get.back();
                                  Get.snackbar(
                                      "Successfully", "Data has been saved",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: aquamarine);
                                } else {
                                  Get.back();
                                  Get.snackbar(
                                      "Please", "Enter Data in textfield",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: aquamarine);
                                }
                              },
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
                    Get.toNamed(RoutesName.materialSales);
                  })
            ])));
  }
}
