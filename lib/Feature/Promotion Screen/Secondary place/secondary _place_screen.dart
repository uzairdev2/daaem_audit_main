// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:daaem_reports/Feature/Category%20Screen.dart/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../../Core/Utils/checkbox.dart';
import '../../../Core/Utils/commonAppbar.dart';
import '../../../Core/Utils/customButton.dart';

class Secondaryplace extends StatelessWidget {
  const Secondaryplace({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Secondary place",
        onBackTap: () {
          Get.back();
          imageContoller.floorValue.value = false;
          imageContoller.gandulaValue.value = false;
          imageContoller.secondaryPromValue.value = false;
          imageContoller.standValue.value = false;
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 15.h, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.yesValue,
                        onChanged: (value) {
                          checkController.yesValue.value = value;
                        },
                      ),
                      name: "Gandula",
                      ontap: () {
                        checkController.yesValue.value =
                            !checkController.yesValue.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.yesValue.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Gandula",
                                imagePath: imageContoller.gandulaimageFile,
                                showImage: imageContoller.gandulaValue,
                                onTap: () {
                                  imageContoller.gandulaImage();
                                },
                              ),
                            ),
                            10.h.ph,
                            Row(
                              children: [
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .handleYesButtonClick("good");
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.gandulaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .handleYesButtonClick(value!);
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .handleYesButtonClick("bad");
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.gandulaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .handleYesButtonClick(value!);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                5.w.pw,
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.noValue,
                        onChanged: (value) {
                          checkController.noValue.value = value;
                        },
                      ),
                      name: "Floor Display",
                      ontap: () {
                        checkController.noValue.value =
                            !checkController.noValue.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.noValue.value,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: CameraWidget(
                                  buttonText:
                                      "Take a Picture for\n Floor Display",
                                  imagePath: imageContoller.floorimageFile,
                                  showImage: imageContoller.floorValue,
                                  onTap: () {
                                    imageContoller.floorImage();
                                  },
                                ),
                              ),
                              10.h.ph,
                              Row(
                                children: [
                                  CustomRadioWidget(
                                    onTap: () {
                                      secondaryFtnController
                                          .floorHandleButtonClick("good");
                                    },
                                    name: "Good",
                                    color: aquamarine,
                                    value: "good",
                                    width: 75.w,
                                    height: 40.h,
                                    groupValue:
                                        secondaryFtnController.floorValue.value,
                                    onChanged: (value) {
                                      secondaryFtnController
                                          .floorHandleButtonClick(value!);
                                    },
                                  ),
                                  5.w.pw,
                                  CustomRadioWidget(
                                    onTap: () {
                                      secondaryFtnController
                                          .floorHandleButtonClick("bad");
                                    },
                                    name: "Bad",
                                    color: aquamarine,
                                    value: "bad",
                                    width: 70.w,
                                    height: 40.h,
                                    groupValue:
                                        secondaryFtnController.floorValue.value,
                                    onChanged: (value) {
                                      secondaryFtnController
                                          .floorHandleButtonClick(value!);
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      );
                    }),
                  ],
                ),
              ],
            ),
            20.h.ph,
            Row(
              children: [
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.noVal,
                        onChanged: (value) {
                          checkController.noVal.value = value;
                        },
                      ),
                      name: "Stand",
                      ontap: () {
                        checkController.noVal.value =
                            !checkController.noVal.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.noVal.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Stand",
                                imagePath: imageContoller.standimageFile,
                                showImage: imageContoller.standValue,
                                onTap: () {
                                  imageContoller.standImage();
                                },
                              ),
                            ),
                            10.h.ph,
                            Row(
                              children: [
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .standHandleButtonClick("good");
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.standValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .standHandleButtonClick(value!);
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .standHandleButtonClick("bad");
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.standValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .standHandleButtonClick(value!);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                5.w.pw,
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.yesVal,
                        onChanged: (value) {
                          checkController.yesVal.value = value;
                        },
                      ),
                      name: "Promotion Area",
                      ontap: () {
                        checkController.yesVal.value =
                            !checkController.yesVal.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.yesVal.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CameraWidget(
                                imagePath:
                                    imageContoller.secondaryPromotionFile,
                                showImage: imageContoller.secondaryPromValue,
                                buttonText:
                                    "Take a Picture for\n Promotional Area",
                                onTap: () {
                                  imageContoller.promoImage();
                                },
                              ),
                            ),
                            10.h.ph,
                            Row(
                              children: [
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .areaHandleButtonClick("good");
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.areaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .areaHandleButtonClick(value!);
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .areaHandleButtonClick("bad");
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.areaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .areaHandleButtonClick(value!);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            20.h.ph,
            CustomButton(
              width: 320.w,
              height: 46.h,
              color: aquamarine,
              name: "Submit",
              ontap: () {
                if (secondaryFtnController.gandulaValue.value != null &&
                        imageContoller.gandulaValue.value != false ||
                    secondaryFtnController.floorValue.value != null &&
                        imageContoller.floorValue.value != false ||
                    secondaryFtnController.standValue.value != null &&
                        imageContoller.standValue.value != false ||
                    secondaryFtnController.areaValue.value != null &&
                        imageContoller.secondaryPromValue.value != false) {
                  if (secondaryFtnController.gandulaValue.value != null &&
                      imageContoller.gandulaValue.value != false) {
                    secondaryFtnController.secomdayGandulaFtnStoringID();
                  }
                  if (secondaryFtnController.floorValue.value != null &&
                      imageContoller.floorValue.value != false) {
                    secondaryFtnController.secondaryFloorFtnGetingIDs();
                  }

                  if (secondaryFtnController.standValue.value != null &&
                      imageContoller.standValue.value != false) {
                    secondaryFtnController.secondaryStandFtnStoringID();
                  }
                  if (secondaryFtnController.standValue.value != null &&
                      imageContoller.standValue.value != false) {
                    secondaryFtnController.secondaryAreaFtnStoringID();
                  }
                  Get.back();
                  checkController.yesVal.value = false;
                  checkController.yesValue.value = false;
                  checkController.noVal.value = false;
                  secondaryFtnController.areaValue.value = "";
                  secondaryFtnController.standValue.value = "";
                  secondaryFtnController.floorValue.value = "";
                  secondaryFtnController.gandulaValue.value = "";
                  checkController.noValue.value = false;
                  imageContoller.floorValue.value = false;
                  imageContoller.gandulaValue.value = false;
                  imageContoller.secondaryPromValue.value = false;
                  imageContoller.standValue.value = false;

                  Get.snackbar("Successfully", "Data has been stored",
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
    );
  }
}
