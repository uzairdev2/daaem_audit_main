// ignore_for_file: unnecessary_null_comparison, must_be_immutable

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Core/API,s Intergartion/API,s.dart';
import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Constant/Text/text.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/alertDialoge/simpleYesorNO.dart';
import '../../../Core/Utils/customButton.dart';
import '../category_screen.dart';

class BtnRow extends StatelessWidget {
  BtnRow({required this.index, super.key});
  int index;
  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);

    return Row(
      children: [
        CustomButton(
            width: 68.w,
            height: 46.h,
            name: "OSA",
            size: 12.sp,
            ontap: () async {
              // imageContoller.takinkSpecficBase(index);

              controller.commonDialog.value.showPopwithCustom(
                  name: sOAPopText,
                  colum: Column(
                    children: [
                      Obx(
                        () => imageContoller.imagevalue[index] != false
                            ? Image.file(
                                imageContoller.rowImages[index],
                                fit: BoxFit.fitWidth,
                                width: 50,
                                height: 50.h,
                              )
                            : 0.ph,
                      ),
                      10.h.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => CustomRadioWidget(
                              onTap: () {
                                osaFtnBTn.handleYesButtonClick("yes", index);
                              },
                              name: "Yes",
                              value: "yes",
                              width: 88.w,
                              height: 40.h,
                              groupValue:
                                  osaFtnBTn.osaVAlueYesorNO[index].value,
                              color: aquamarine,
                              onChanged: (value) {
                                osaFtnBTn.handleYesButtonClick(value!, index);
                              },
                            ),
                          ),
                          10.w.pw,
                          Obx(
                            () => CustomRadioWidget(
                              color: red,
                              onTap: () {
                                osaFtnBTn.handleNoButtonClick("no", index);
                              },
                              name: "No",
                              value: "no",
                              width: 88.w,
                              height: 40.h,
                              groupValue:
                                  osaFtnBTn.osaVAlueYesorNO[index].value,
                              onChanged: (value) {
                                osaFtnBTn.handleYesButtonClick(value!, index);
                              },
                            ),
                          ),
                        ],
                      ),
                      10.h.ph,
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          width: 87.w,
                          height: 40.h,
                          color: red,
                          name: "Submit",
                          ontap: () {
                            if (osaFtnBTn.osaVAlueYesorNO[index] != null) {
                              // await boxname.close();

                              // osaFtnBTn.updateValueAtIndex(index, "yes");

                              osaFtnBTn.osaFtnStoringID(index, [
                                {
                                  "retailerid":
                                      storingIDController.retailerid.value,
                                  "branchid":
                                      storingIDController.branchid.value,
                                  "custmoreid":
                                      storingIDController.custmoreid.value,
                                  "categoryid":
                                      storingIDController.categoryid.value,
                                  "productId": logPro
                                      .productList[index].productId
                                      .toString(),
                                  "osaValue":
                                      osaFtnBTn.osaVAlueYesorNO[index].value,
                                  "barcode": logPro.productList[index].barcode
                                      .toString(),
                                  "imagedata": "Image is not selected Yet",
                                },
                              ]);

                              Get.back();

                              osaFtnBTn.getOsaValue(index);
                              Get.snackbar("Saved", "SuccessFully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: red);
                            } else {
                              Get.back();
                              Get.snackbar("Failed", "To save data",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: red);
                            }
                          },
                        ),
                      )
                    ],
                  ));
            }),
        12.w.pw,
        Obx(
          () => Visibility(
            visible: osaFtnBTn.osaBtnvalue[index].value == true,
            child: Row(
              children: [
                CustomButton(
                  width: 74.w,
                  height: 46.h,
                  size: 12.sp,
                  name: "Pricing",
                  ontap: () {
                    controller.commonDialog.value.showPopCustom(
                      title: pricePopText,
                      index: index,
                      btn1Name: "Yes",
                      btn2Name: "No",
                      btn1Ontap: () {
                        checkController.handleYesButtonClick("Yes");
                      },
                      takePictureStatus: 0,
                      btn2Ontap: () {
                        checkController.handleNoButtonClick("No");
                      },
                      submitOntap: () {
                        storingIDController.PricingPutData([
                          {
                            "retailerid": storingIDController.retailerid.value,
                            "branchid": storingIDController.branchid.value,
                            "custmoreid": storingIDController.custmoreid.value,
                            "categoryid": storingIDController.categoryid.value,
                            "productId":
                                logPro.productList[index].productId.toString(),
                            "pricevalue":
                                checkController.selectRadioBtnVal.value,
                            "imagedata": imageContoller.takeBase64Image.value,
                          }
                        ]);

                        storingIDController.pricingGetData();
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
                    Get.dialog(MyAlertDialog(
                        title: stockLevelPopText,
                        yesTap: () {
                          stockLevelFtnBtn.handleYesButtonClick("Normal");
                        },
                        noTap: () {
                          stockLevelFtnBtn.handleNoButtonClick("Low");
                        },
                        containerHeight: 40.h,
                        containerWidth: 100.w,
                        option1Text: "Normal",
                        radio1: Obx(
                          () => Radio<String>(
                            value: "Normal",
                            activeColor: white,
                            groupValue: stockLevelFtnBtn.stockValue.value,
                            onChanged: (p0) {
                              stockLevelFtnBtn.handleNoButtonClick(p0!);
                            },
                          ),
                        ),
                        option2Text: "Low",
                        radio2: Obx(
                          () => Radio<String>(
                            value: "Low",
                            activeColor: white,
                            groupValue: stockLevelFtnBtn.stockValue.value,
                            onChanged: (p0) {
                              stockLevelFtnBtn.handleNoButtonClick(p0!);
                            },
                          ),
                        ),
                        onSubmit: () {
                          // storingIDController.stockLevelPutData([
                          //   {
                          //     "retailerid":
                          //         storingIDController.retailerid.value,
                          //     "branchid": storingIDController.branchid.value,
                          //     "custmoreid":
                          //         storingIDController.custmoreid.value,
                          //     "categoryid":
                          //         storingIDController.categoryid.value,
                          //     "productId": logPro.productList[index].productId
                          //         .toString(),
                          //     "stockLevelValue":
                          //         checkController.selectRadioBtnVal.value,
                          //     "imagedata": imageContoller.takeBase64Image.value
                          //   }
                          // ]);

                          // storingIDController.stockLevelGetData();
                          Get.back();
                        }));
                  },
                ),
                7.w.pw,
                CustomButton(
                  width: 79.w,
                  height: 46.h,
                  size: 12.sp,
                  name: "Accessible ",
                  ontap: () {
                    controller.commonDialog.value.showPopCustom(
                      title: accessPopText,
                      index: index,
                      btn1Name: "Yes",
                      btn2Name: "No",
                      takePictureStatus: 0,
                      btn1Ontap: () {
                        checkController.handleYesButtonClick("Yes");
                      },
                      btn2Ontap: () {
                        checkController.handleNoButtonClick("No");
                      },
                      submitOntap: () {
                        storingIDController.accessiblePutData([
                          {
                            "retailerid": storingIDController.retailerid.value,
                            "branchid": storingIDController.branchid.value,
                            "custmoreid": storingIDController.custmoreid.value,
                            "categoryid": storingIDController.categoryid.value,
                            "productId":
                                logPro.productList[index].productId.toString(),
                            "accessibleValue":
                                checkController.selectRadioBtnVal.value,
                            "imagedata": imageContoller.takeBase64Image.value
                          }
                        ]);

                        storingIDController.accessibleGetData();
                        Get.back();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
