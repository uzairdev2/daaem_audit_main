// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors_in_immutables

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
import '../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../Core/Utils/commonAppbar.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/custom_text.dart';
import '../../Core/Utils/custom_textfield.dart';
import '../Category Screen.dart/category_screen.dart';
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
  final _formKey = GlobalKey<FormState>();
  String? selectedProduct;
  var regularPrice = "";
  var promtionalprice = "";
  late ApiClass logPro;

  @override
  Widget build(BuildContext context) {
    logPro = Provider.of<ApiClass>(context);

    return Scaffold(
        appBar: CommonAppBar(
          title: 'Promotion',
          onBackTap: () {
            Get.back();
            imageContoller.promotionalValue.value = false;
          },
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
                  setState(() {
                    logPro.setCategoryId(selectedProduct.toString());
                  });
                },
                items: logPro.productList
                    .map((item) => DropdownMenuItem<String>(
                          onTap: () {
                            storingIDController.priceProductID.value =
                                item.productId.toString();
                            imageContoller.promotionalValue.value = false;
                          },
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CameraWidget(
                    buttonTextSize: 16.sp,
                    showImage: imageContoller.promotionalValue,
                    imagePath: imageContoller.promotionalimageFile,
                    onTap: () {
                      imageContoller.promotionalImage();
                    },
                    containerWidth: 100.w,
                    containerHeight: 70.h,
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: imageContoller.promotionalValue.value,
                  child: Column(
                    children: [
                      20.h.ph,
                      CustomButton(
                        name: "Price",
                        ontap: () {
                          storingIDController.priceLabelFtnGetingIDs();
                          controller.commonDialog.value.showPopwithCustom(
                              name: priceLabelPopText,
                              colum: Column(
                                children: [
                                  Row(
                                    children: [
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: aquamarine,
                                          onTap: () {
                                            priceLabelController
                                                .handleYesButtonClick("yes");
                                          },
                                          name: "Yes",
                                          value: "yes",
                                          groupValue: priceLabelController
                                              .priceValue.value,
                                          width: 90.w,
                                          height: 40.w,
                                          onChanged: (value) {
                                            priceLabelController
                                                .handleYesButtonClick(value!);
                                          },
                                        ),
                                      ),
                                      10.w.pw,
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: red,
                                          onTap: () {
                                            priceLabelController
                                                .handleNoButtonClick("no");
                                          },
                                          name: "No",
                                          value: "no",
                                          groupValue: priceLabelController
                                              .priceValue.value,
                                          width: 90.w,
                                          height: 40.w,
                                          onChanged: (value) {
                                            priceLabelController
                                                .handleNoButtonClick(value!);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  15.h.ph,
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: CustomText(
                                            name: 'Regular Price',
                                            size: 18.sp,
                                            weightFont: FontWeight.w600,
                                          ),
                                        ),
                                        10.h.ph,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: CustomTextfield(
                                            hintext: 'Enter Regular Price',
                                            textType: TextInputType.number,
                                            onchanged: (value) {
                                              regularPrice = value;
                                            },
                                            vlid: (p0) {
                                              if (regularPrice.isEmpty) {
                                                return 'Please enter a value';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        20.h.ph,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: CustomText(
                                            name: 'Promotion Price',
                                            size: 18.sp,
                                            weightFont: FontWeight.w600,
                                          ),
                                        ),
                                        10.h.ph,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: CustomTextfield(
                                            hintext: 'Enter Promotion Price',
                                            textType: TextInputType.number,
                                            onchanged: (value) {
                                              promtionalprice = value;
                                            },
                                            vlid: (p0) {
                                              if (promtionalprice.isEmpty) {
                                                return 'Please enter a value';
                                              } else if (int.parse(
                                                      promtionalprice) >=
                                                  int.parse(regularPrice)) {
                                                return 'Promotional value should be < Regular value';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        15.h.ph,
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: CustomButton(
                                            name: "Submit",
                                            height: 40.h,
                                            width: 88.w,
                                            ontap: () {
                                              if (_formKey.currentState!
                                                      .validate() &&
                                                  priceLabelController
                                                      .priceValue.isNotEmpty) {
                                                priceLabelController
                                                    .priceLabelFtnStoringID([
                                                  {
                                                    "table_name": 'priceLabel',
                                                    "retailerid":
                                                        storingIDController
                                                            .retailerid.value,
                                                    "branchid":
                                                        storingIDController
                                                            .branchid.value,
                                                    "custmoreid":
                                                        storingIDController
                                                            .custmoreid.value,
                                                    "categoryid":
                                                        storingIDController
                                                            .categoryid.value,
                                                    "priceProductid":
                                                        storingIDController
                                                            .priceProductID
                                                            .value,
                                                    "regularPrice":
                                                        regularPrice,
                                                    "promotonalPrice":
                                                        promtionalprice,
                                                    "priceLabelValue":
                                                        priceLabelController
                                                            .priceValue.value,    
                                                    "priceImage": imageContoller
                                                        .promotionalBase64Image
                                                        .value,
            
                                                  }
                                                ]);

                                                Get.back();
                                                Get.snackbar("Saved",
                                                    "Data Saved SucccessFully",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor: white);
                                              } else {
                                                Get.snackbar("Faild",
                                                    "Faild to Save becaused Value of Price  is empty",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor: white);

                                                // Form is valid, perform necessary actions
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
