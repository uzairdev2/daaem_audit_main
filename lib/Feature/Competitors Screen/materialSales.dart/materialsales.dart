// ignore_for_file: avoid_print, must_be_immutable

import 'package:daaem_reports/Core/Constant/Images/images.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../../Core/Utils/checkbox.dart';
import '../../../Core/Utils/customButton.dart';
import '../../../Core/Utils/customText.dart';
import '../../../Core/Utils/custom_textfield.dart';

class MaterialSalesScreen extends StatelessWidget {
  MaterialSalesScreen({super.key});
  List names = [];
  List images = [];
  String notes = '';
  String materialName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          name: "Sales Material",
          size: 18.sp,
          weightFont: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 24.h),
          child: InkWell(
            onTap: () {
              Get.back();
              imageContoller.materialOtherValue.value == false;
              imageContoller.materialPromositeValue.value == false;
              imageContoller.materialfloorValue.value == false;
              imageContoller.materialgandulaValue.value == false;
              checkController.checkValue2.value == false;
              checkController.otherValue2.value == false;
              checkController.promositeValue2.value == false;
              checkController.checkValue1.value == false;

              notes = "";
              materialName = "";
              images.clear();
            },
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: aquamarine, borderRadius: BorderRadius.circular(5.r)),
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
<<<<<<< HEAD
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
                          onChanged: (value) {
                            checkController.checkValue2.value = value;
                            // ignore: unrelated_type_equality_checks
                            if (checkController.checkValue2 == false) {
                              images.remove(imageContoller
                                  .materialgandulaBase64Image.value);
                              names.remove("Gandula");
                            } else {
                              names.add("Gandula");
                            }
                          },
                          value: checkController.checkValue2),
                      name: "Gandula",
                      ontap: () {
                        checkController.checkValue2.value =
                            !checkController.checkValue2.value;
                        if (checkController.checkValue2.isFalse) {
                          images.remove(
                              imageContoller.materialgandulaBase64Image.value);
                          names.remove("Gandula");
                          imageContoller.materialgandulaValue.value = false;
                        } else {
                          names.add("Gandula");
                        }
                      },
                    ),
                    10.h.ph,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(() {
                        return Visibility(
                            visible: checkController.checkValue2.value,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n gandula",
                                imagePath:
                                    imageContoller.materialgandulaimageFile,
                                showImage: imageContoller.materialgandulaValue,
                                onTap: () async {
                                  await imageContoller.materialGandulaImage();

                                  if (imageContoller.materialgandulaBase64Image
                                      .value.isNotEmpty) {
                                    images.add(imageContoller
                                        .materialgandulaBase64Image.value);
                                    print("working add value in list ");
                                  }
                                },
                              ),
                            ));
                      }),
                    ),
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
                        value: checkController.checkValue1,
                        onChanged: (value) {
                          checkController.checkValue1.value = value;
=======
        child: SingleChildScrollView(
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
                            onChanged: (value) {
                              checkController.checkValue2.value = value;
                              if (checkController.checkValue2.isFalse) {
                                images.remove(imageContoller
                                    .materialgandulaBase64Image.value);
                                names.remove("Gandula");
                              } else {
                                names.add("Gandula");
                              }
                            },
                            value: checkController.checkValue2),
                        name: "Gandula",
                        ontap: () {
                          checkController.checkValue2.value =
                              !checkController.checkValue2.value;
>>>>>>> fdf38fc3c3a444d1598c20bec4c4a185136d11ed
                          if (checkController.checkValue2.isFalse) {
                            images.remove(
                                imageContoller.materialgandulaBase64Image.value);
                            names.remove("Gandula");
                          } else {
                            names.add("Gandula");
                          }
                        },
                      ),
                      10.h.ph,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() {
                          return Visibility(
                              visible: checkController.checkValue2.value,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CameraWidget(
                                  buttonText: "Take a Picture for\n gandula",
                                  imagePath:
                                      imageContoller.materialgandulaimageFile,
                                  showImage: imageContoller.materialgandulaValue,
                                  onTap: () {
                                    imageContoller
                                        .materialGandulaImage()
                                        .then((value) {
                                      if (checkController
                                              .gandulaCheckvalue.isTrue &&
                                          imageContoller
                                              .materialgandulaBase64Image
                                              .isNotEmpty) {
                                        images.add(imageContoller
                                            .materialgandulaBase64Image.value);
                                      }
                                    });
                                  },
                                ),
                              ));
                        }),
                      ),
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
                          value: checkController.checkValue1,
                          onChanged: (value) {
                            checkController.checkValue1.value = value;
                            if (checkController.checkValue2.isFalse) {
                              images.remove(
                                  imageContoller.materialfloorBase64Image.value);
                              names.remove("Floor Displa");
                            } else {
                              names.add("Floor Displa");
                            }
                          },
                        ),
                        name: "Floor Display",
                        ontap: () {
                          checkController.checkValue1.value =
                              !checkController.checkValue1.value;
                          if (checkController.checkValue2.isFalse) {
                            images.remove(
                                imageContoller.materialfloorBase64Image.value);
                            names.remove("Floor Display");
                          } else {
                            names.add("Floor Display");
                          }
                        },
                      ),
                      10.h.ph,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() {
                          return Visibility(
                              visible: checkController.checkValue1.value,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CameraWidget(
                                  buttonText: "Take a Picture for\n Floor",
                                  imagePath:
                                      imageContoller.materialfloorimageFile,
                                  showImage: imageContoller.materialfloorValue,
                                  onTap: () {
                                    imageContoller
                                        .materiaFloorImage()
                                        .then((value) {
                                      if (checkController.checkValue1.isTrue &&
                                          imageContoller.materialfloorBase64Image
                                              .isNotEmpty) {
                                        images.add(imageContoller
                                            .materialfloorBase64Image.value);
                                      }
                                    });
                                  },
                                ),
                              ));
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              20.h.ph,
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomButtonCheckBox(
                          width: 160.w,
                          height: 46.h,
                          size: 12.sp,
                          color: aquamarine,
                          checkbox: CustomCheckBox(
                            value: checkController.otherValue2,
                            onChanged: (value) {
                              checkController.otherValue2.value = value;
                              if (checkController.otherValue2.isFalse &&
                                  imageContoller
<<<<<<< HEAD
                                      .materiaFloorImage()
                                      .then((value) {
                                    if (checkController.checkValue1.isTrue &&
                                        imageContoller.materialfloorBase64Image
                                            .value.isNotEmpty) {
                                      print("working add value in list ");

                                      images.add(imageContoller
                                          .materialfloorBase64Image.value);
                                    }
                                  });
=======
                                      .materialOtherBase64Image.isNotEmpty) {
                                images.remove(imageContoller
                                    .materialOtherBase64Image.value);
                              } else {}
                            },
                          ),
                          name: "Other",
                          ontap: () {
                            checkController.otherValue2.value =
                                !checkController.otherValue2.value;
                            if (checkController.otherValue2.isFalse &&
                                imageContoller
                                    .materialOtherBase64Image.isNotEmpty) {
                              images.remove(
                                  imageContoller.materialOtherBase64Image.value);
                              // names.remove("other");
                            } else {
                              // names.add("other");
                            }
                          },
                        ),
                      ),
                      15.h.ph,
                      Obx(
                        () => Visibility(
                          visible: checkController.otherValue2.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CameraWidget(
                                  buttonText: "Take a Picture for\n Others",
                                  imagePath:
                                      imageContoller.materialOtherimageFile,
                                  showImage: imageContoller.materialOtherValue,
                                  onTap: () {
                                    imageContoller
                                        .materialOtherImage()
                                        .then((value) {
                                      if (checkController.otherValue2.isTrue &&
                                          imageContoller.materialOtherBase64Image
                                              .isNotEmpty) {
                                        images.add(imageContoller
                                            .materialOtherBase64Image.value);
                                      }
                                    });
                                  },
                                ),
                              ),
                              10.h.ph,
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: CustomText(
                                  name: "Point Of Sales Material",
                                  size: 12.sp,
                                  weightFont: FontWeight.w600,
                                ),
                              ),
                              10.h.ph,
                              CustomTextfield(
                                hintext: "Enter the name of Material",
                                bgcolor: lightgrey,
                                width: 160.w,
                                height: 46.h,
                                onchanged: (value) {
                                  print("this is the value $value");
                                  materialName = value;
                                  if (checkController.otherValue2.isTrue) {
                                    names.add(materialName);
                                  } else {
                                    names.remove(materialName);
                                  }
>>>>>>> fdf38fc3c3a444d1598c20bec4c4a185136d11ed
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.w.pw,
                  Column(
                    children: [
                      CustomButtonCheckBox(
                        width: 160.w,
                        height: 46.h,
                        size: 12.sp,
                        color: aquamarine,
                        checkbox: CustomCheckBox(
                          value: checkController.promositeValue2,
                          onChanged: (value) {
                            checkController.promositeValue2.value = value;
                            if (checkController.promositeValue2.isFalse) {
                              images.remove(imageContoller
                                  .materialPromositeBase64Image.value);
                              names.remove("Promo Site");
                            } else {
                              names.add("Promo Site");
                            }
                          },
                        ),
                        name: "Promo Site",
                        ontap: () {
<<<<<<< HEAD
                          checkController.otherValue2.value =
                              !checkController.otherValue2.value;
                          if (checkController.otherValue2.isFalse &&
                              imageContoller
                                  .materialOtherBase64Image.isNotEmpty) {
                            images.remove(
                                imageContoller.materialOtherBase64Image.value);
                            names.remove("other");
                          } else {
                            names.add("other");
                          }
                        },
                      ),
                    ),
                    15.h.ph,
                    Obx(
                      () => Visibility(
                        visible: checkController.otherValue2.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Others",
                                imagePath:
                                    imageContoller.materialOtherimageFile,
                                showImage: imageContoller.materialOtherValue,
                                onTap: () {
                                  imageContoller
                                      .materialOtherImage()
                                      .then((value) {
                                    if (checkController.otherValue2.isTrue &&
                                        imageContoller.materialOtherBase64Image
                                            .isNotEmpty) {
                                      print("working add value in list ");

                                      images.add(imageContoller
                                          .materialOtherBase64Image.value);
                                    }
                                  });
                                },
                              ),
                            ),
                            10.h.ph,
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomText(
                                name: "Point Of Sales Material",
                                size: 12.sp,
                                weightFont: FontWeight.w600,
                              ),
                            ),
                            10.h.ph,
                            CustomTextfield(
                              hintext: "Enter the name of Material",
                              bgcolor: lightgrey,
                              width: 160.w,
                              height: 46.h,
                              onchanged: (value) {
                                materialName = value;
                                if (checkController.otherValue2.isTrue) {}
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                5.w.pw,
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: aquamarine,
                      checkbox: CustomCheckBox(
                        value: checkController.promositeValue2,
                        onChanged: (value) {
                          checkController.promositeValue2.value = value;
=======
                          checkController.promositeValue2.value =
                              !checkController.promositeValue2.value;
>>>>>>> fdf38fc3c3a444d1598c20bec4c4a185136d11ed
                          if (checkController.promositeValue2.isFalse) {
                            images.remove(imageContoller
                                .materialPromositeBase64Image.value);
                            names.remove("Promo Site");
                          } else {
                            names.add("Promo Site");
                          }
                        },
                      ),
                      15.h.ph,
                      Obx(() {
                        return Visibility(
                            visible: checkController.promositeValue2.value,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Promo Site",
                                imagePath:
                                    imageContoller.materialPromositeimageFile,
                                showImage: imageContoller.materialPromositeValue,
                                onTap: () {
                                  imageContoller
                                      .materialPromositeImage()
                                      .then((value) {
                                    if (checkController.promositeValue2.isTrue &&
                                        imageContoller
                                            .materialPromositeBase64Image
                                            .isNotEmpty) {
                                      images.add(imageContoller
                                          .materialPromositeBase64Image.value);
                                    } else {
                                      names.remove(imageContoller
                                          .materialPromositeBase64Image.value);
                                    }
                                  });
                                },
                              ),
                            ));
                      }),
                    ],
                  )
                ],
              ),
<<<<<<< HEAD
            ),
            10.h.ph,
            CustomTextfield(
              hintext: "Enter Text",
              bgcolor: lightgrey,
              width: 303.w,
              height: 55.h,
              onchanged: (value) {
                notes = value;
              },
            ),
            10.h.ph,
            10.h.ph,
            20.h.ph,
            CustomButton(
              width: 320.w,
              height: 46.h,
              color: aquamarine,
              name: "Submit",
              ontap: () {
                print(images.length);
                print(names.length);
                if ((checkController.checkValue2.isTrue &&
                        imageContoller.materialgandulaBase64Image.isNotEmpty) ||
                    (checkController.checkValue1.isTrue &&
                        imageContoller.floorBase64Image.isNotEmpty) ||
                    (checkController.otherValue2.isTrue &&
                        imageContoller.materialOtherBase64Image.isNotEmpty &&
                        notes.isNotEmpty) ||
                    (checkController.promositeValue2.isTrue &&
                            imageContoller
                                .materialPromositeBase64Image.isNotEmpty) &&
                        notes.isNotEmpty) {
                  for (var i = 0; i < names.length; i++) {
                    print("for loop working ");
                    competitiorMaterialFtnController
                        .competitiorMaterialFtnStoringID([
                      {
                        "table_name": 'Competitior_material',
                        "retailerid": storingIDController.retailerid.value,
                        "branchid": storingIDController.branchid.value,
                        "customerid": storingIDController.custmoreid.value,
                        "categoryid  ": storingIDController.categoryid.value,
                        "name": names[i],
                        "image": images[i],
                        "notes": notes,
                      }
                    ]);
                    print("for loop working End ");
                  }

                  Get.back();
                  imageContoller.materialOtherValue.value = false;
                  imageContoller.materialPromositeValue.value = false;
                  imageContoller.materialfloorValue.value = false;
                  imageContoller.materialgandulaValue.value = false;
                  imageContoller.materialgandulaValue.value = false;
                  checkController.checkValue2.value = false;
                  checkController.otherValue2.value = false;
                  checkController.promositeValue2.value = false;
                  checkController.checkValue1.value = false;
                  notes = "";
                  materialName = "";
                  images.clear();
                  names.clear();
                  Get.snackbar("Successfully", "Data has been stored",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                  Get.back();
                  Get.snackbar("Successfully", "Data has been stored",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                } else if (checkController.checkValue2.isTrue &&
                    imageContoller.materialgandulaBase64Image.isEmpty) {
                  Get.snackbar("Failed", "Please take a picture for Gandula",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                } else if (checkController.checkValue1.isTrue &&
                    imageContoller.materialfloorBase64Image.isEmpty) {
                  Get.snackbar("Failed", "Please take a picture for Floor",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                } else if (checkController.otherValue2.isTrue &&
                    (imageContoller.materialOtherBase64Image.isEmpty ||
                        materialName.isEmpty)) {
                  Get.snackbar("Failed",
                      "Please take a picture for Other and provide the name of the material",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                } else if (checkController.promositeValue2.isTrue &&
                    imageContoller.materialPromositeBase64Image.isEmpty) {
                  Get.snackbar("Failed", "Please take a picture for Promo site",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                } else {
                  Get.snackbar("Failed",
                      "Data has not been saved. Please select something",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: aquamarine);
                }
              },
            )
          ],
=======
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
                hintext: "Enter Text",
                bgcolor: lightgrey,
                width: 303.w,
                height: 55.h,
                onchanged: (value) {
                  notes = value;
                },
              ),
              10.h.ph,
              10.h.ph,
              20.h.ph,
              CustomButton(
                width: 320.w,
                height: 46.h,
                color: aquamarine,
                name: "Submit",
                ontap: () {
                  // names.clear();
                  // images.clear();
                  if ((checkController.checkValue2.isTrue &&
                          imageContoller.materialgandulaBase64Image.isNotEmpty) ||
                      (checkController.checkValue1.isTrue &&
                          imageContoller.floorBase64Image.isNotEmpty) ||
                      (checkController.otherValue2.isTrue &&
                          imageContoller.materialOtherBase64Image.isNotEmpty &&
                          notes.isNotEmpty) ||
                      (checkController.promositeValue2.isTrue &&
                              imageContoller
                                  .materialPromositeBase64Image.isNotEmpty) &&
                          notes.isNotEmpty) {
                    for (var i = 0; i < names.length; i++) {
                      print("for loop working ");
                      competitiorMaterialFtnController
                          .competitiorMaterialFtnStoringID([
                        {
                          "table_name": 'Competitior_material',
                          "retailerid": storingIDController.retailerid.value,
                          "branchid": storingIDController.branchid.value,
                          "customerid": storingIDController.custmoreid.value,
                          "categoryid": storingIDController.categoryid.value,
                          "name": names[i],
                          "notes": notes,
                          "image": images[i],
                        }
                      ]);
                      print("for loop working End ");
                    }
        
                    Get.back();
                    imageContoller.materialOtherValue.value = false;
                    imageContoller.materialPromositeValue.value = false;
                    imageContoller.materialfloorValue.value = false;
                    imageContoller.materialgandulaValue.value = false;
                    imageContoller.materialgandulaValue.value = false;
                    checkController.checkValue2.value = false;
                    checkController.otherValue2.value = false;
                    checkController.promositeValue2.value = false;
                    checkController.checkValue1.value = false;
                    notes = "";
                    materialName = "";
                    images.clear();
                    Get.snackbar("Successfully", "Data has been stored",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                    Get.back();
                    Get.snackbar("Successfully", "Data has been stored",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  } else if (checkController.checkValue2.isTrue &&
                      imageContoller.materialgandulaBase64Image.isEmpty) {
                    Get.snackbar("Failed", "Please take a picture for Gandula",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  } else if (checkController.checkValue1.isTrue &&
                      imageContoller.materialfloorBase64Image.isEmpty) {
                    Get.snackbar("Failed", "Please take a picture for Floor",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  } else if (checkController.otherValue2.isTrue &&
                      (imageContoller.materialOtherBase64Image.isEmpty ||
                          materialName.isEmpty)) {
                    Get.snackbar("Failed",
                        "Please take a picture for Other and provide the name of the material",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  } else if (checkController.promositeValue2.isTrue &&
                      imageContoller.materialPromositeBase64Image.isEmpty) {
                    Get.snackbar("Failed", "Please take a picture for Promo site",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  } else {
                    Get.snackbar("Failed",
                        "Data has not been saved. Please select something",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: aquamarine);
                  }
                },
              )
            ],
          ),
>>>>>>> fdf38fc3c3a444d1598c20bec4c4a185136d11ed
        ),
      ),
    );
  }
}
