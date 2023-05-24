// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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

  String? selectedCategory;

  String barcode = '';

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // Custom color for the scanner overlay
      'Cancel', // Text for the cancel button
      true, // Enable flash option

      ScanMode
          .DEFAULT, // Scan mode (barcode, QR code, or all supported formats)
    );

    if (!mounted) return;

    setState(() {
      if (barcodeScanRes != '-1') {
        // Barcode successfully scanned
        barcode = barcodeScanRes;
      } else {
        // No barcode scanned
        barcode = 'Barcode cannot be scanned';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // String categoryId = '';
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
                            log('heeee ${item.categoryName}');

                            print('Category Id: ${item.categoryId}');
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
                              btn1Ontap: () {},
                              btn2Ontap: () {},
                              submitOntap: () {
                                Get.back();
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
                              btn1Ontap: () {},
                              btn2Ontap: () {},
                              submitOntap: () {},
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
                              btn1Ontap: () {},
                              btn2Ontap: () {},
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
                                              width: 110.w,
                                              size: 12.sp,
                                              height: 40.h,
                                              color: grey,
                                              hint: "Select",
                                              textColor: white,
                                              name: "Left Side",
                                              countries: item),
                                          5.w.pw,
                                          TextDropdown(
                                              size: 12.sp,
                                              color: grey,
                                              width: 99.w,
                                              textColor: white,
                                              hint: "Select",
                                              height: 40.h,
                                              name: "Right Side",
                                              countries: item),
                                        ],
                                      ),
                                    ),
                                    20.h.ph,
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //       width: 47.w,
                                    //       height: 47.h,
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.transparent,
                                    //           border: Border.all(
                                    //             color: aquamarine,
                                    //           ),
                                    //           borderRadius:
                                    //               BorderRadius.circular(10.r)),
                                    //       child: Center(
                                    //         child: Image.asset(
                                    //           camera,
                                    //           width: 22.w,
                                    //           height: 20.h,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     10.w.pw,
                                    //     CustomText(
                                    //       name: "Take a Picture",
                                    //       color: black,
                                    //       size: 12.sp,
                                    //       alignment: TextAlign.center,
                                    //       weightFont: FontWeight.w700,
                                    //     ),
                                    //   ],
                                    // ),

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
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                color: aquamarine,
                                                width: 250.w,
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
                                                        Text(
                                                            "${logPro.productList[index].barcode}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ]),
                                                ),
                                                // name: "Item ${index + 1}",
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
                                                      .proFile();
                                                },
                                                child: Obx(
                                                  () => imageContoller.imageFile
                                                              .value ==
                                                          null
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
                                                              .imageFile.value!,
                                                          width: 50.w,
                                                          height: 50.h,
                                                        ),
                                                ),
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
                                                    // barcode: barcode,
                                                    title: sOAPopText,
                                                    imageStatus: 1,
                                                    btn1Name: "Yes",
                                                    btn2Name: "No",
                                                    btn1Ontap: () {
                                                      scanBarcode();
                                                    },
                                                    btn2Ontap: () {},
                                                    submitOntap: () {},
                                                  );
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
                                                    btn1Ontap: () {},
                                                    btn2Ontap: () {},
                                                    submitOntap: () {},
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
                                                    btn1Name: "Yes",
                                                    btn2Name: "No",
                                                    btn1Ontap: () {},
                                                    btn2Ontap: () {},
                                                    submitOntap: () {},
                                                  );
                                                },
                                              ),
                                              // CustomButton(
                                              //   width: 68.w,
                                              //   height: 46.h,
                                              //   name: "OSA",
                                              //   size: 12.sp,
                                              //   ontap: () {
                                              //     controller.commonDialog.value
                                              //         .showPopCustom(
                                              //       title: sOAPopText,
                                              //       btn1Name: "Yes",
                                              //       btn2Name: "No",
                                              //       btn1Ontap: () {},
                                              //       btn2Ontap: () {},
                                              //       submitOntap: () {},
                                              //     );
                                              //   },
                                              // ),

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
                                                    btn1Ontap: () {},
                                                    btn2Ontap: () {},
                                                    submitOntap: () {},
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
