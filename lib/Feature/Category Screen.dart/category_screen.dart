// ignore_for_file: must_be_immutable, unnecessary_null_comparison, unrelated_type_equality_checks, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:daaem_reports/Core/Model/API,s%20Models/product_model.dart';
import 'package:daaem_reports/Core/Utils/Camera%20Widget/camera_widget.dart';
import 'package:daaem_reports/Core/Utils/alertDialoge/simpleYesorNO.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:daaem_reports/Feature/Category%20Screen.dart/widegt/btnrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
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
  var selectedIndex = -1;
  String? selectedCategory;
  String? leftCategory;
  String? rightCategory;
  bool barValueCheck = false;
  bool isCategoryChanged = false;
  List<ProductModel> productListed = [];

  // RxList<File?> rowImages = <File?>[].obs;
  List<String> productImagesList = [];
  late ApiClass logPro;
  List<dynamic> keys = [];

  @override
  Widget build(BuildContext context) {
    logPro = Provider.of<ApiClass>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
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
                  setState(() async {
                    logPro.setCategoryId(selectedCategory.toString());
                    final box = await Hive.openBox('myBox');
                    keys = box.keys.toList();
                    if (isCategoryChanged) productImagesList.clear();
                    for (dynamic key in keys) {
                      String name = box.get(key).toString();
                      productImagesList.add(name);
                      print('productImagesList: $name');
                    }
                    box.close();
                    Hive.close();
                  });
                },
                items: logPro.categoryList
                    .map((item) => DropdownMenuItem<String>(
                          onTap: () async {
                            isCategoryChanged = true;
                            logPro.productList.clear();
                            await logPro.getCategoryData(
                                categoryid: item.categoryId.toString());
                            storingIDController.categoryid.value =
                                item.categoryId!;
                            if (logPro.productList != null) {
                              print("this is keys length ${keys.length}");
                              for (int i = 0; i < keys.length; i++) {
                                for (int z = 0;
                                    z < logPro.productList.length;
                                    z++) {
                                  if (logPro.productList[z].productId ==
                                      keys[i]) {
                                    logPro.productList[z].imagePath =
                                        productImagesList[i];
                                  }
                                }
                              }
                            }
                            item.productModel = logPro.productList;
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
                                widgetTrue: true,
                                widget:
                                    SizedBox(child: Image.asset(planogramImg)),
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
                                        backgroundColor: white);
                                  } else {
                                    Get.back();
                                    Get.snackbar("Faild",
                                        "Faild to Save becaused Value of cleaning not Slelect Yet",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: white);
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
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: CameraWidget(
                                          imagePath:
                                              imageContoller.cleanimageFile,
                                          showImage:
                                              imageContoller.cleaningValueImage,
                                          onTap: () {
                                            imageContoller.cleanessImage();
                                          },
                                        )),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CustomButton(
                                        name: "Submit",
                                        height: 40.h,
                                        width: 88.w,
                                        ontap: () {
                                          if (cleaningFtnBtn.cleaningValue !=
                                                  null &&
                                              imageContoller
                                                      .cleanBase64Image.value !=
                                                  null) {
                                            cleaningFtnBtn.cleaningFtnStoringID(
                                                imagedata: imageContoller
                                                    .cleanBase64Image.value);
                                            Get.back();
                                            Get.snackbar("Saved",
                                                "Data Saved SucccessFully",
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          } else {
                                            Get.back();
                                            Get.snackbar("Faild",
                                                "Faild to Save becaused Value of cleaning not Slelect Yet",
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
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
                                colum: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            TextDropdown(
                                                dropvalue: leftCategory,
                                                onChanged: (value) {
                                                  leftCategory = value;
                                                  setState(() {});
                                                },
                                                width: 105.w,
                                                size: 12.sp,
                                                height: 40.h,
                                                color: aquamarine,
                                                hint: "Select",
                                                textColor: white,
                                                name: "Left Side",
                                                countries: item),
                                            5.w.pw,
                                            TextDropdown(
                                                size: 12.sp,
                                                color: aquamarine,
                                                width: 105.w,
                                                onChanged: (value) {
                                                  rightCategory = value;
                                                  setState(() {});
                                                },
                                                textColor: white,
                                                dropvalue: rightCategory,
                                                hint: "select",
                                                height: 40.h,
                                                name: "Right Side",
                                                countries: item),
                                          ],
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
                                                Get.snackbar("Saved",
                                                    "Data has  been Saved",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                              }
                                              {
                                                Get.back();
                                                Get.snackbar("Faild",
                                                    "Data has not been Saved",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM);
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    );
                                  },
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
                                        //  imageContoller.rowImages.value = List.generate(10, (index) => null).obs;
                                        scanController.barValueCheck
                                            .add(false.obs);
                                        productDetailController.osaVAlueYesorNO
                                            .add("".obs);
                                        productDetailController
                                            .stockVAlueYesorNO
                                            .add("".obs);
                                        productDetailController
                                            .priceVAlueYesorNO
                                            .add("".obs);
                                        productDetailController
                                            .accessVAlueYesorNO
                                            .add("".obs);
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
                                                ontap: () {},
                                              ),
                                              SizedBox(
                                                width: 90.w,
                                                height: 50.h,
                                                child: Center(
                                                  child: ListTile(
                                                    subtitle: (logPro
                                                            .productList[index]
                                                            .imagePath
                                                            .isNotEmpty)
                                                        ? Container(
                                                            width: 75.w,
                                                            height: 50.h,
                                                            decoration: BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                        color:
                                                                            red)),
                                                            child: Image.file(
                                                                File(logPro
                                                                    .productList[
                                                                        index]
                                                                    .imagePath),
                                                                fit: BoxFit
                                                                    .cover))
                                                        : CustomText(
                                                            name: "Picture",
                                                            color: Colors.black,
                                                            size: 12.sp,
                                                            alignment: TextAlign
                                                                .center,
                                                            weightFont:
                                                                FontWeight.w700,
                                                          ),
                                                    onTap: () {
                                                      setState(() {
                                                        pickImage(index);
                                                      });
                                                    },
                                                  ),
                                                  // if (index < imageContoller.rowImages.length) {
                                                  //   return Container(
                                                  //     width: 75.w,
                                                  //     height: 50.h,
                                                  //     decoration: BoxDecoration(
                                                  //         border: Border.all(color: red)),
                                                  //     child: Image.file(
                                                  //       imageContoller.rowImages[index],
                                                  //       fit: BoxFit.cover,
                                                  //     ),
                                                  //   );
                                                  // } else {
                                                  //   return InkWell(
                                                  //     onTap: () {
                                                  //       setState(() {
                                                  //         selectedIndex = index;
                                                  //       });
                                                  //       imageContoller.takeImage(index);
                                                  //     },
                                                  //     child: CustomText(
                                                  //       name: "Picture",
                                                  //       color: Colors.black,
                                                  //       size: 12.sp,
                                                  //       alignment: TextAlign
                                                  //           .center,
                                                  //       weightFont:
                                                  //           FontWeight.w700,
                                                  //     ),
                                                  //   );
                                                  // }
                                                ),
                                              ),
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
                            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                            //   return Testing();
                            // }));
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

  void pickImage(int index) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        logPro.productList[index].imagePath = image.path;
        saveDataHive(
            logPro.productList[index].productId.toString(), image.path);
      });
    }
  }

// convert image in vase64
  String imageToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  void saveDataHive(String productId, String imagePath) async {
    await Hive.initFlutter();
    final box = await Hive.openBox('myBox');
    await box.put(productId, imagePath);
    final name = box.get(productId);
    print('image: $name');
    await box.close();
    await Hive.close();
  }
}

class CustomRadioWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String value;
  double? width;
  final double height;
  final Color color;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  CustomRadioWidget({
    super.key,
    required this.onTap,
    required this.name,
    required this.color,
    required this.value,
    this.width,
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
            5.w.pw,
            Text(
              name,
              style: TextStyle(fontSize: 12.sp, color: Colors.white),
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
