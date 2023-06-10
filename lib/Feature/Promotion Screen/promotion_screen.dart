// ignore_for_file: unnecessary_null_comparison

import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Constant/Text/text.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Core/API,s Intergartion/API,s.dart';
import '../../Core/Controller/controller_detail.dart';
import '../../Core/Routes/routes_name.dart';
import '../../Core/Utils/alertDialoge/simpleYesorNO.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/custom_text.dart';
import '../Home Screen.dart/Common Widgets/custom_dropdown_button.dart';

// ignore: must_be_immutable
class PromotionScreen extends StatefulWidget {
  PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  CommonDialog commonDialog = CommonDialog();

  List<String> countries = ['Coke', 'pepsi', 'Dew', 'Spirit', '7up'];

  String? selectedProduct;

  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);

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
              45.h.ph,
              CustomDropdown(
                hint: 'Select a Product',
                isDense: true,
                isExpanded: true,
                onChanged: (String? newValue) {
                  selectedProduct = newValue;
                  setState(() {});
                },
                items: logPro.productList
                    .map((item) => DropdownMenuItem<String>(
                          onTap: () {},
                          value: item.productName,
                          child: CustomText(
                            name: item.productName.toString(),
                          ),
                        ))
                    .toList(),
              ),
              45.h.ph,
              Visibility(
                visible: selectedProduct != null,
                child: Column(
                  children: [
                    CustomButton(
                      name: "Price Label",
                      ontap: () {
                        commonDialog.showPopCustom(
                          title: priceLabelPopText,
                          btn1Name: "Yes",
                          btn2Name: "No",
                          btn1Ontap: () {
                            checkController.handleYesButtonClick("Yes");
                          },
                          btn2Ontap: () {
                            checkController.handleNoButtonClick("No");
                          },
                          submitOntap: () {
                            storingIDController.priceLabelFtnStoringID();
                            storingIDController.priceLabelFtnGetingIDs();
                            Get.back();
                          },
                        );
                      },
                    ),
                    39.h.ph,
                    CustomButton(
                      name: "Secondary place",
                      ontap: () {
                        Get.toNamed(RoutesName.secondaryplace);
                      },
                    ),
                    39.h.ph,
                    CustomButton(
                      name: "Location",
                      ontap: () {
                        locationController.locationFtnGetingIDs();
                        Get.dialog(MyAlertDialog(
                            title: locationPopText,
                            yesTap: () {
                              locationController.handleYesButtonClick("Good");
                            },
                            noTap: () {
                              locationController.handleNoButtonClick("Bad");
                            },
                            containerHeight: 40.h,
                            containerWidth: 95.w,
                            option1Text: "Good",
                            radio1: Obx(
                              () => Radio<String>(
                                value: "Good",
                                activeColor: white,
                                groupValue:
                                    locationController.locationValue.value,
                                onChanged: (p0) {
                                  checkController.handleYesButtonClick(p0!);
                                },
                              ),
                            ),
                            option2Text: "Bad",
                            radio2: Obx(
                              () => Radio<String>(
                                value: "Bad",
                                activeColor: white,
                                groupValue:
                                    locationController.locationValue.value,
                                onChanged: (p0) {
                                  checkController.handleNoButtonClick(p0!);
                                },
                              ),
                            ),
                            onSubmit: () {
                              if (locationController.locationValue != null) {
                                locationController.locationFtnStoringID();
                                Get.back();
                                Get.snackbar(
                                    "Saved", "Data Saved SucccessFully",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: red);
                              } else {
                                Get.back();

                                Get.snackbar("Faild", "Failed to  Saved Data",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: red);
                              }
                            }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
