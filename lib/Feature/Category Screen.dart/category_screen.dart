// ignore_for_file: must_be_immutable, unnecessary_null_comparison, unrelated_type_equality_checks

import 'dart:developer';

import 'package:daaem_reports/Core/Utils/alertDialoge/simpleYesorNO.dart';
import 'package:daaem_reports/Core/Utils/common_dialogue.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:daaem_reports/Feature/Category%20Screen.dart/widegt/btnrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Core/API,s Intergartion/API,s.dart';
import '../../Core/Constant/Colors/colors.dart';
import '../../Core/Constant/Images/images.dart';
import '../../Core/Constant/Text/text.dart';
import '../../Core/Controller/controller_detail.dart';
import '../../Core/Routes/routes_name.dart';
import '../../Core/Utils/text_and_dropdown.dart';
import '../../Core/Utils/custom_button.dart';
import '../../Core/Utils/custom_text.dart';
import '../Home Screen.dart/Common Widgets/custom_dropdown_button.dart';
import '../Home Screen.dart/Common Widgets/title_text.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> item = ["Coffee", "Grean Tea", "Pepesi", "Milk"];

  String base64iamge = "";

  String? selectedCategory;
  String? leftCategory;
  String? rightCategory;
  bool barValueCheck = false;
  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
            name: "Category",
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
          padding: EdgeInsets.only(left: 16.w, top: 15.h, right: 16.w),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TitleText(title: 'Category'),
              10.h.ph,
              CustomDropdown(
                hint: 'Select a Category',
                isDense: true,
                isExpanded: true,
                onChanged: (String? newValue) {
                  selectedCategory = newValue;
                  setState(() {});
                },
                items: logPro.categoryList
                    .map((item) => DropdownMenuItem<String>(
                          onTap: () async {
                            logPro.productList.clear();
                            await logPro.getCategoryData(
                                categoryid: item.categoryId.toString());

                            storingIDController.categoryid.value =
                                item.categoryId!;
                          },
                          value: item.categoryName,
                          child: Text(
                            item.categoryName.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              20.h.ph,
              Visibility(
                visible: selectedCategory != null,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        name: "Categories",
                        size: 14.sp,
                        weightFont: FontWeight.w700,
                        color: black,
                      ),
                    ),
                    10.h.ph,
                    Row(
                      children: [
                        CustomButton(
                          width: 155.w,
                          height: 46.h,
                          name: "Planogram",
                          ontap: () {
                            planogramFtn.planogramFtnGetingIDs();
                            Get.dialog(MyAlertDialog(
                                title: planogramPopText,
                                yesTap: () {
                                  planogramFtn.handleYesButtonClick("yes");
                                },
                                noTap: () {
                                  planogramFtn.handleNoButtonClick("no");
                                },
                                containerHeight: 40.h,
                                containerWidth: 90.w,
                                option1Text: "Yes",
                                radio1: Obx(
                                  () => Radio<String>(
                                    value: "yes",
                                    activeColor: white,
                                    groupValue:
                                        planogramFtn.planogramValue.value,
                                    onChanged: (p0) {
                                      planogramFtn.handleYesButtonClick(p0!);
                                    },
                                  ),
                                ),
                                option2Text: "No",
                                radio2: Obx(
                                  () => Radio<String>(
                                    value: "no",
                                    activeColor: white,
                                    groupValue:
                                        planogramFtn.planogramValue.value,
                                    onChanged: (p0) {
                                      planogramFtn.handleNoButtonClick(p0!);
                                    },
                                  ),
                                ),
                                onSubmit: () {
                                  if (planogramFtn.planogramValue.value !=
                                      null) {
                                    planogramFtn.planogramFtnStoringID();
                                    Get.back();
                                    Get.snackbar(
                                        "Saved", "Data Saved SucccessFully",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: red);
                                  } else {
                                    Get.back();
                                    Get.snackbar("Faild",
                                        "Faild to Save becaused Value of cleaning not Slelect Yet",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: red);
                                  }
                                }));
                          },
                        ),
                        16.w.pw,
                        CustomButton(
                          width: 155.w,
                          height: 46.h,
                          name: "Cleanness",
                          ontap: () {
                            cleaningFtnBtn.cleaningFtnGetingID();
                            controller.commonDialog.value.showPopwithCustom(
                                name: cleannessPopText,
                                colum: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Obx(
                                          () => CustomRadioWidget(
                                            color: aquamarine,
                                            onTap: () {
                                              cleaningFtnBtn
                                                  .handleYesButtonClick("yes");
                                            },
                                            name: "Yes",
                                            value: "yes",
                                            groupValue: cleaningFtnBtn
                                                .cleaningValue.value,
                                            width: 90.w,
                                            height: 40.w,
                                            onChanged: (value) {
                                              cleaningFtnBtn
                                                  .handleYesButtonClick(value!);
                                            },
                                          ),
                                        ),
                                        10.w.pw,
                                        Obx(
                                          () => CustomRadioWidget(
                                            color: red,
                                            onTap: () {
                                              cleaningFtnBtn
                                                  .handleNoButtonClick("no");
                                            },
                                            name: "No",
                                            value: "no",
                                            groupValue: cleaningFtnBtn
                                                .cleaningValue.value,
                                            width: 90.w,
                                            height: 40.w,
                                            onChanged: (value) {
                                              cleaningFtnBtn
                                                  .handleNoButtonClick(value!);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    15.h.ph,
                                    const Align(
                                        alignment: Alignment.centerLeft,
                                        child: CameraWIdget()),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CustomButton(
                                        name: "Submit",
                                        height: 40.h,
                                        width: 88.w,
                                        ontap: () {
                                          if (cleaningFtnBtn.cleaningValue !=
                                              null) {
                                            cleaningFtnBtn.cleaningFtnStoringID(
                                                imagedata: imageContoller
                                                    .cleanBase64Image.value);
                                            Get.back();
                                            Get.snackbar("Saved",
                                                "Data Saved SucccessFully");
                                          } else {
                                            Get.back();
                                            Get.snackbar("Faild",
                                                "Faild to Save becaused Value of cleaning not Slelect Yet");
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ));
                          },
                        )
                      ],
                    ),
                    22.h.ph,
                    Row(
                      children: [
                        CustomButton(
                          width: 155.w,
                          height: 46.h,
                          name: "SOS",
                          ontap: () {},
                        ),
                        16.w.pw,
                        CustomButton(
                          width: 155.w,
                          height: 46.h,
                          name: "Neighbors ",
                          ontap: () {
                            controller.commonDialog.value.showPopwithCustom(
                                name: neighborsPopText,
                                colum: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: Row(
                                        children: [
                                          TextDropdown(
                                              dropvalue: leftCategory,
                                              onChanged: (value) {
                                                leftCategory = value;
                                              },
                                              width: 110.w,
                                              size: 12.sp,
                                              height: 40.h,
                                              color: grey,
                                              hint: "leftCategory",
                                              textColor: white,
                                              name: "Left Side",
                                              countries: item),
                                          5.w.pw,
                                          TextDropdown(
                                              size: 12.sp,
                                              color: grey,
                                              width: 99.w,
                                              onChanged: (value) {
                                                setState(() {
                                                  rightCategory = value;
                                                });
                                              },
                                              textColor: white,
                                              dropvalue: rightCategory,
                                              hint: "select",
                                              height: 40.h,
                                              name: "Right Side",
                                              countries: item),
                                        ],
                                      ),
                                    ),
                                    20.h.ph,
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CustomButton(
                                        width: 87.w,
                                        height: 40.h,
                                        color: aquamarine,
                                        name: "Submit",
                                        ontap: () {
                                          if (leftCategory != null &&
                                              rightCategory != null) {
                                            storingIDController
                                                .neighborsFtnStoringID(
                                                    leftCategory!,
                                                    rightCategory!);

                                            storingIDController
                                                .neighborsFtnGetingID();

                                            Get.back();
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ));
                          },
                        )
                      ],
                    ),
                    20.h.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(pricingIcon, width: 24.w, height: 24.h),
                            10.w.pw,
                            CustomText(
                              name: "Products",
                              size: 16.sp,
                              weightFont: FontWeight.w600,
                              color: black,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            categoryController.visibilityTrue2();
                          },
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: const Center(
                                child: Icon(
                              Icons.arrow_drop_down,
                              color: grey,
                            )),
                          ),
                        )
                      ],
                    ),
                    19.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: categoryController.visibilityValue2.value,
                        child: Column(
                          children: [
                            logPro.productList.isEmpty
                                ? const SizedBox.shrink()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: logPro.productList.length,
                                    itemBuilder: (context, index) {
                                      for (int i = 0; i <= index; i++) {
                                        imageContoller.imagevalue
                                            .add(false.obs);
                                        osaFtnBTn.osaBtnvalue.add(false.obs);
                                        osaFtnBTn.osaVAlueYesorNO.add("".obs);
                                      }

                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                color: aquamarine,
                                                width: 200.w,
                                                height: 55.h,
                                                changeStatus: 2,
                                                customWidget: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.w),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            "${logPro.productList[index].productName}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        CustomText(
                                                          name: logPro
                                                              .productList[
                                                                  index]
                                                              .barcode
                                                              .toString(),
                                                          color: white,
                                                          weightFont:
                                                              FontWeight.w600,
                                                        ),
                                                      ]),
                                                ),
                                                name:
                                                    "${logPro.productList[index].productName}",
                                                ontap: () {
                                                  log("here is product id ${logPro.productList[index].productId}");
                                                  log("here is product name ${logPro.productList[index].productName}");
                                                  log("here is product barcode ${logPro.productList[index].barcode}");
                                                },
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await imageContoller
                                                      .takeImage(index);
                                                  imageContoller
                                                      .imagevalue[index]
                                                      .value = true;
                                                },
                                                child: Obx(() => imageContoller
                                                                .imagevalue[
                                                            index] ==
                                                        false
                                                    ? CustomText(
                                                        name: "Picture",
                                                        color: Colors.black,
                                                        size: 12.sp,
                                                        alignment:
                                                            TextAlign.center,
                                                        weightFont:
                                                            FontWeight.w700,
                                                      )
                                                    : Container(
                                                        width: 75.w,
                                                        height: 50.h,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: red)),
                                                        child: Image.file(
                                                          imageContoller
                                                              .rowImages[index],
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      )),
                                              )
                                            ],
                                          ),
                                          10.h.ph,
                                          BtnRow(index: index),
                                          13.h.ph,
                                        ],
                                      );
                                    }),
                          ],
                        ),
                      );
                    }),
                    20.h.ph,
                    Row(
                      children: [
                        CustomButton(
                          width: 155.w,
                          color: aquamarine,
                          height: 46.h,
                          name: "Promotion",
                          ontap: () {
                            Get.toNamed(RoutesName.planogramScreen);
                          },
                        ),
                        16.w.pw,
                        CustomButton(
                          width: 155.w,
                          color: aquamarine,
                          height: 46.h,
                          name: "Competitors",
                          ontap: () {
                            Get.toNamed(RoutesName.competitorsScreen);
                          },
                        ),
                      ],
                    ),
                    20.h.ph,
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

class CustomRadioWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String value;
  final double width;
  final double height;
  final Color color;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioWidget({
    super.key,
    required this.onTap,
    required this.name,
    required this.color,
    required this.value,
    required this.width,
    required this.height,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Radio<String>(
              value: value,
              activeColor: Colors.white,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
