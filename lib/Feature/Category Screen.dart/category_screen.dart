// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'dart:developer';

import 'package:daaem_reports/Core/Utils/sizebox.dart';
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
  CategoryScreen({super.key});

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
                            controller.commonDialog.value.showPopCustom(
                              title: planogramPopText,
                              customwidget: SizedBox(
                                width: double.infinity,
                                height: 100.h,
                                child: Image.asset(logoAndname),
                              ),
                              btn1Name: "Yes",
                              btn2Name: "No",
                              imageStatus: 1,
                              btn1Ontap: () {
                                checkController.handleYesButtonClick("Yes");
                              },
                              btn2Ontap: () {
                                checkController.handleNoButtonClick("No");
                              },
                              submitOntap: () async {
                                if (checkController.selectRadioBtnVal != null) {
                                  log("here is check value ${checkController.selectRadioBtnVal.value}");
                                  await storingIDController
                                      .planogramFtnStoringID();
                                  storingIDController.planogramFtnGetingIDs();

                                  checkController.selectRadioBtnVal.value = "";

                                  Get.back();
                                }
                              },
                            );
                          },
                        ),
                        16.w.pw,
                        CustomButton(
                          width: 155.w,
                          height: 46.h,
                          name: "Cleanness",
                          ontap: () {
                            controller.commonDialog.value.showPopCustom(
                              title: cleannessPopText,
                              imageStatus: 0,
                              btn1Name: "Yes",
                              btn2Name: "No",
                              btn1Ontap: () {
                                checkController.handleYesButtonClick("Yes");
                              },
                              btn2Ontap: () {
                                checkController.handleNoButtonClick("No");
                              },
                              submitOntap: () async {
                                if (checkController.selectRadioBtnVal != null &&
                                    imageContoller.cleanBase64Image.value !=
                                        null) {
                                  await storingIDController
                                      .cleaningFtnStoringID(
                                          imagedata: imageContoller
                                              .cleanBase64Image.value);
                                  storingIDController.cleaningFtnGetingID();
                                  checkController.selectRadioBtnVal.value = "";
                                  Get.back();
                                } else {
                                  Get.snackbar("Picture Required ",
                                      "Please take a picture ",
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              },
                            );
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
                          ontap: () {
                            controller.commonDialog.value.showPopCustom(
                              title: sOSPopText,
                              btn1Name: "Yes",
                              btn2Name: "No",
                              btn1Ontap: () {
                                checkController.handleYesButtonClick("Yes");
                              },
                              btn2Ontap: () {
                                checkController.handleNoButtonClick("No");
                              },
                              submitOntap: () {},
                            );
                          },
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
                                ? SizedBox.shrink()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: logPro.productList.length,
                                    itemBuilder: (context, index) {
                                      for (int i = 0; i <= index; i++) {
                                        imageContoller.imagevalue
                                            .add(false.obs);
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
                                                // ignore: unrelated_type_equality_checks
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
                                                    : Image.file(
                                                        imageContoller
                                                            .takeimageFile[
                                                                index]
                                                            .value!,
                                                        fit: BoxFit.fitWidth,
                                                        width: 50,
                                                        height: 50.h,
                                                      )),
                                              )
                                            ],
                                          ),
                                          10.h.ph,
                                          Wrap(
                                            children: [
                                              CustomButton(
                                                width: 68.w,
                                                height: 46.h,
                                                name: "OSA",
                                                size: 12.sp,
                                                ontap: () {
                                                  controller.commonDialog.value
                                                      .showPopCustom(
                                                          title: sOAPopText,
                                                          imageStatus: 1,
                                                          barcodeStatus: 0,
                                                          btn1Name: "Yes",
                                                          btn2Name: "No",
                                                          takePictureStatus: 0,
                                                          btn1Ontap: () {
                                                            checkController
                                                                .handleYesButtonClick(
                                                                    "Yes");
                                                            scanController
                                                                .scanBarcode(logPro
                                                                    .productList[
                                                                        index]
                                                                    .barcode
                                                                    .toString());
                                                          },
                                                          btn2Ontap: () {
                                                            checkController
                                                                .handleNoButtonClick(
                                                                    "No");
                                                          },
                                                          submitOntap: () {
                                                            if (checkController
                                                                    .selectRadioBtnVal
                                                                    .value !=
                                                                null) {
                                                              storingIDController
                                                                  .osaFtnStoringID([
                                                                {
                                                                  "retailerid":
                                                                      storingIDController
                                                                          .retailerid
                                                                          .value,
                                                                  "branchid":
                                                                      storingIDController
                                                                          .branchid
                                                                          .value,
                                                                  "custmoreid":
                                                                      storingIDController
                                                                          .custmoreid
                                                                          .value,
                                                                  "categoryid":
                                                                      storingIDController
                                                                          .categoryid
                                                                          .value,
                                                                  "productId": logPro
                                                                      .productList[
                                                                          index]
                                                                      .productId
                                                                      .toString(),
                                                                  "osaValue":
                                                                      checkController
                                                                          .selectRadioBtnVal
                                                                          .value,
                                                                  "barcode": logPro
                                                                      .productList[
                                                                          index]
                                                                      .barcode
                                                                      .toString(),
                                                                  "imagedata":
                                                                      imageContoller
                                                                          .takeBase64Image
                                                                          .value
                                                                }
                                                              ]);

                                                              storingIDController
                                                                  .osaFtnGetingID();
                                                              Get.back();
                                                            }
                                                          });
                                                },
                                              ),
                                              12.w.pw,
                                              CustomButton(
                                                width: 74.w,
                                                height: 46.h,
                                                size: 12.sp,
                                                name: "Pricing",
                                                ontap: () {
                                                  controller.commonDialog.value
                                                      .showPopCustom(
                                                    title: pricePopText,
                                                    btn1Name: "Yes",
                                                    btn2Name: "No",
                                                    btn1Ontap: () {
                                                      checkController
                                                          .handleYesButtonClick(
                                                              "Yes");
                                                    },
                                                    takePictureStatus: 0,
                                                    btn2Ontap: () {
                                                      checkController
                                                          .handleNoButtonClick(
                                                              "No");
                                                    },
                                                    submitOntap: () {
                                                      storingIDController
                                                          .PricingPutData([
                                                        {
                                                          "retailerid":
                                                              storingIDController
                                                                  .retailerid
                                                                  .value,
                                                          "branchid":
                                                              storingIDController
                                                                  .branchid
                                                                  .value,
                                                          "custmoreid":
                                                              storingIDController
                                                                  .custmoreid
                                                                  .value,
                                                          "categoryid":
                                                              storingIDController
                                                                  .categoryid
                                                                  .value,
                                                          "productId": logPro
                                                              .productList[
                                                                  index]
                                                              .productId
                                                              .toString(),
                                                          "pricevalue":
                                                              checkController
                                                                  .selectRadioBtnVal
                                                                  .value,
                                                          "imagedata":
                                                              imageContoller
                                                                  .takeBase64Image
                                                                  .value
                                                        }
                                                      ]);

                                                      storingIDController
                                                          .pricingGetData();
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                              10.w.pw,
                                              CustomButton(
                                                width: 78.w,
                                                height: 46.h,
                                                size: 12.sp,
                                                name: "Stock level",
                                                ontap: () {
                                                  controller.commonDialog.value
                                                      .showPopCustom(
                                                    title: stockLevelPopText,
                                                    btn1Name: "Normal",
                                                    takePictureStatus: 0,
                                                    btn2Name: "Low",
                                                    value1: "Normal",
                                                    value2: "Low",
                                                    btn1Ontap: () {
                                                      checkController
                                                          .handleYesButtonClick(
                                                              "Normal");
                                                    },
                                                    btn2Ontap: () {
                                                      checkController
                                                          .handleNoButtonClick(
                                                              "Low");
                                                    },
                                                    submitOntap: () {
                                                      storingIDController
                                                          .stockLevelPutData([
                                                        {
                                                          "retailerid":
                                                              storingIDController
                                                                  .retailerid
                                                                  .value,
                                                          "branchid":
                                                              storingIDController
                                                                  .branchid
                                                                  .value,
                                                          "custmoreid":
                                                              storingIDController
                                                                  .custmoreid
                                                                  .value,
                                                          "categoryid":
                                                              storingIDController
                                                                  .categoryid
                                                                  .value,
                                                          "productId": logPro
                                                              .productList[
                                                                  index]
                                                              .productId
                                                              .toString(),
                                                          "stockLevelValue":
                                                              checkController
                                                                  .selectRadioBtnVal
                                                                  .value,
                                                          "imagedata":
                                                              imageContoller
                                                                  .takeBase64Image
                                                                  .value
                                                        }
                                                      ]);

                                                      storingIDController
                                                          .stockLevelGetData();
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                              7.w.pw,
                                              CustomButton(
                                                width: 79.w,
                                                height: 46.h,
                                                size: 12.sp,
                                                name: "Accessible ",
                                                ontap: () {
                                                  controller.commonDialog.value
                                                      .showPopCustom(
                                                    title: accessPopText,
                                                    btn1Name: "Yes",
                                                    btn2Name: "No",
                                                    takePictureStatus: 0,
                                                    btn1Ontap: () {
                                                      checkController
                                                          .handleYesButtonClick(
                                                              "Yes");
                                                    },
                                                    btn2Ontap: () {
                                                      checkController
                                                          .handleNoButtonClick(
                                                              "No");
                                                    },
                                                    submitOntap: () {
                                                      storingIDController
                                                          .accessiblePutData([
                                                        {
                                                          "retailerid":
                                                              storingIDController
                                                                  .retailerid
                                                                  .value,
                                                          "branchid":
                                                              storingIDController
                                                                  .branchid
                                                                  .value,
                                                          "custmoreid":
                                                              storingIDController
                                                                  .custmoreid
                                                                  .value,
                                                          "categoryid":
                                                              storingIDController
                                                                  .categoryid
                                                                  .value,
                                                          "productId": logPro
                                                              .productList[
                                                                  index]
                                                              .productId
                                                              .toString(),
                                                          "accessibleValue":
                                                              checkController
                                                                  .selectRadioBtnVal
                                                                  .value,
                                                          "imagedata":
                                                              imageContoller
                                                                  .takeBase64Image
                                                                  .value
                                                        }
                                                      ]);

                                                      storingIDController
                                                          .accessibleGetData();
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
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
