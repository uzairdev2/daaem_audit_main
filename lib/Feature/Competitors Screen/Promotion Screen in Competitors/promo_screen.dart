import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Core/API,s Intergartion/API,s.dart';
import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../../Core/Utils/commonAppbar.dart';
import '../../../Core/Utils/common_dialogue.dart';
import '../../../Core/Utils/customButton.dart';
import '../../../Core/Utils/customText.dart';
import '../../../Core/Utils/custom_textfield.dart';
import '../../Home Screen.dart/Common Widgets/custom_dropdown_button.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  CommonDialog commonDialog = CommonDialog();
  final _formKey = GlobalKey<FormState>();

  String? selectedProduct;
  String? mregularPrice = "";
  String? mpromtionalprice = "";
  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);
    return Scaffold(
        appBar: CommonAppBar(
          title: 'Promotion',
          onBackTap: () {
            Get.back();
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
                  setState(() {});
                },
                items: logPro.productList
                    .map((item) => DropdownMenuItem<String>(
                          onTap: () {
                            competitorPromotionController.productID?.value =
                                item.productId.toString();
                            imageContoller.promotionScreenValue.value = false;
                          },
                          value: item.productName,
                          child: CustomText(
                            name: item.productName.toString(),
                          ),
                        ))
                    .toList(),
              ),
              39.h.ph,
              Form(
                key: _formKey,
                child: Visibility(
                  visible: selectedProduct != null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CameraWidget(
                          imagePath: imageContoller.promotionScreenimageFile,
                          showImage: imageContoller.promotionScreenValue,
                          onTap: () {
                            imageContoller.promotionScreenImage();
                          },
                        ),
                      ),
                      20.h.ph,
                      CustomText(
                        name: 'Regular Price',
                        size: 18.sp,
                        weightFont: FontWeight.w600,
                      ),
                      10.h.ph,
                      CustomTextfield(
                        hintext: 'Enter Regular Price',
                        textType: TextInputType.number,
                        vlid: (p0) {
                          if (mregularPrice!.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                        onchanged: (value) {
                          mregularPrice = value;
                        },
                      ),
                      20.h.ph,
                      CustomText(
                        name: 'Promotion Price',
                        size: 18.sp,
                        weightFont: FontWeight.w600,
                      ),
                      10.h.ph,
                      CustomTextfield(
                        hintext: 'Enter Promotion Price',
                        textType: TextInputType.number,
                        vlid: (p0) {
                          if (mpromtionalprice!.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                        onchanged: (value) {
                          mpromtionalprice = value;
                        },
                      ),
                      20.h.ph,
                      CustomButton(
                        width: 320.w,
                        height: 46.h,
                        color: aquamarine,
                        name: "Submit",
                        ontap: () {
                          if (_formKey.currentState!.validate() &&
                              imageContoller.promotionScreenValue.isTrue) {
                            competitorPromotionController
                                .competitorPromotionFtnStoringID(
                                    mregularPrice.toString(),
                                    mpromtionalprice.toString());
                            Get.snackbar("Successfully", "Data has been Saved",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: aquamarine);
                          } else {
                            Get.snackbar("faild", "please Select something",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: aquamarine);
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
