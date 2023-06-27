// ignore_for_file: file_names, unnecessary_null_comparison, unnecessary_import, prefer_is_empty, prefer_if_null_operators

import 'package:daaem_reports/Core/Model/API,s%20Models/SecondaryModel.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:daaem_reports/Feature/Category%20Screen.dart/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import '../../../Core/API,s Intergartion/API,s.dart';
import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../../Core/Utils/checkbox.dart';
import '../../../Core/Utils/commonAppbar.dart';
import '../../../Core/Utils/customButton.dart';

class Secondaryplace extends StatefulWidget {
  const Secondaryplace({super.key});

  @override
  State<Secondaryplace> createState() => _SecondaryplaceState();
}

class _SecondaryplaceState extends State<Secondaryplace> {
  List<SecondaryModel> secondaryList = [];
  late ApiClass logPro;
  // Future<SecondaryModel?> getObjectByKey(String key) async {
  //   await Hive.initFlutter();
  //   final box = await Hive.openBox<SecondaryModel>('myBox');
  //   final model = box.get(key);
  //   box.close();
  //   Hive.close();
  //   return model;
  // }

  // Future<void> initializeSecondaryList() async {
  //   for (int i = 0; i < 4; i++) {
  //     var key = "$i/${logPro.selectedCategoryId}/${logPro.selectedProductId}";
  //     var model = await getObjectByKey(key);
  //     if (model != null) {
  //       setState(() {
  //         secondaryList.add(model);
  //       });
  //     }
  //   }
  // }

  List names = [];
  List images = [];
  List values = [];

  @override
  Widget build(BuildContext context) {
    logPro = Provider.of<ApiClass>(context);
    // initializeSecondaryList();
    void saveDataHive(String key, SecondaryModel model) async {
      await Hive.initFlutter();
      if (Hive.isBoxOpen('myBox')) {
        await Hive.box('myBox').close();
      }
      await Hive.openBox<SecondaryModel>('myBox');
      final box = Hive.box<SecondaryModel>('myBox');
      box.put(key, model);
      box.close();
      Hive.close();
    }

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
        padding: EdgeInsets.only(left: 14.w, top: 15.h, right: 14.w),
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

                          if (checkController.yesValue.value) {
                            names.add("Gandula");
                          } else {
                            names.remove("Gandula");
                          }
                        },
                      ),
                      name: "Gandula",
                      ontap: () {
                        checkController.yesValue.value =
                            !checkController.yesValue.value;

                        if (checkController.yesValue.value) {
                          names.add("Gandula");
                        } else {
                          names.remove("Gandula");
                        }
                        print("here is name" +
                            names.toString() +
                            names.length.toString());
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
                                onTap: () async {
                                  await imageContoller.gandulaImage();

                                  if (checkController.yesValue.value) {
                                    images.add(imageContoller.gandulaBase64Image
                                        .toString());
                                  } else {
                                    images.remove(imageContoller
                                        .gandulaBase64Image
                                        .toString());
                                  }
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

                                    print(
                                        "secondaryFtnControllergandulaValue.value ${secondaryFtnController.gandulaValue.value}");
                                    if (secondaryFtnController
                                            .gandulaValue.value ==
                                        "Good") {
                                  // if(values.length> 2) values.remove("bad");
                                      values.add("good");
                                    }
                                    // else {
                                    //   values.remove("bad");
                                    //   values.remove("good");
                                    // }
                                    print(
                                        "here is value ${secondaryFtnController.gandulaValue.value} ${values.toString()}");
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  // width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.gandulaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .handleYesButtonClick(value!);

                                    if (secondaryFtnController
                                            .gandulaValue.value ==
                                        "good") {
                                  //  if(values.length>2) values.remove("bad");
                                      values.add("good");
                                    }
                                    // else {
                                    //   values.add("bad");
                                    //   values.add(value);
                                    // }
                                    print("here is value" +
                                        value.toString() +
                                        values.toString());
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .handleYesButtonClick("bad");

                                    if (secondaryFtnController
                                            .gandulaValue.value ==
                                        "bad") {
                                      // values.remove("good");
                                      values.add("bad");
                                    }
                                    // else {

                                    //   values.remove("good");
                                    //   values.remove("bad");
                                    // }
                                    print(
                                        "here is value ${secondaryFtnController.gandulaValue.value} ${values.toString()}");
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  // width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.gandulaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .handleYesButtonClick(value!);

                                    if (secondaryFtnController
                                            .gandulaValue.value ==
                                        "bad") {
                                      // values.remove("good");
                                      values.add("bad");
                                    }
                                    //  else {
                                    //   values.remove("bad");
                                    // }
                                    print("here is ws value" +
                                        value.toString() +
                                        values.toString());
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

                          if (checkController.noValue.value) {
                            names.add("Floor Display");
                          } else {
                            names.remove("Floor Display");
                          }
                          print("here is name" +
                              names.toString() +
                              names.length.toString());
                        },
                      ),
                      name: "Floor Display",
                      ontap: () {
                        checkController.noValue.value =
                            !checkController.noValue.value;

                        if (checkController.noValue.value) {
                          names.add("Floor Display");
                        } else {
                          names.remove("Floor Display");
                        }
                        print("here is name" +
                            names.toString() +
                            names.length.toString());
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
                                      "Take a Picture for\n floor display",
                                  imagePath: imageContoller.floorimageFile,
                                  showImage: imageContoller.floorValue,
                                  onTap: () {
                                    imageContoller.floorImage();
                                    if (checkController.noValue.value) {
                                      images.add(imageContoller.floorBase64Image
                                          .toString());
                                    } else {
                                      images.remove(imageContoller
                                          .floorBase64Image
                                          .toString());
                                    }
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

                                      if (secondaryFtnController
                                              .floorValue.value ==
                                          "good") {
                                        values.add("good");
                                        // values.remove("bad");
                                      }

                                      print("here is ws value" +
                                          secondaryFtnController
                                              .floorValue.value +
                                          values.toString());
                                    },
                                    name: "Good",
                                    color: aquamarine,
                                    value: "good",
                                    // width: 75.w,
                                    height: 40.h,
                                    groupValue:
                                        secondaryFtnController.floorValue.value,
                                    onChanged: (value) {
                                      secondaryFtnController
                                          .floorHandleButtonClick(value!);
                                      if (secondaryFtnController
                                              .floorValue.value ==
                                          "good") {
                                        values.add("good");
                                        // values.remove("bad");
                                      }

                                      print("here is ws value" +
                                          secondaryFtnController
                                              .floorValue.value +
                                          values.toString());
                                    },
                                  ),
                                  5.w.pw,
                                  CustomRadioWidget(
                                    onTap: () {
                                      secondaryFtnController
                                          .floorHandleButtonClick("bad");

                                      if (secondaryFtnController
                                              .floorValue.value ==
                                          "bad") {
                                        values.add("bad");
                                        // values.remove("good");
                                      }

                                      print("here is ws value" +
                                          secondaryFtnController
                                              .floorValue.value +
                                          values.toString());
                                    },
                                    name: "Bad",
                                    color: aquamarine,
                                    value: "bad",
                                    // width: 70.w,
                                    height: 40.h,
                                    groupValue:
                                        secondaryFtnController.floorValue.value,
                                    onChanged: (value) {
                                      secondaryFtnController
                                          .floorHandleButtonClick(value!);

                                      if (secondaryFtnController
                                              .floorValue.value ==
                                          "bad") {
                                        values.add("bad");
                                        // values.remove("good");
                                      }

                                      print("here is ws value" +
                                          secondaryFtnController
                                              .floorValue.value +
                                          values.toString());
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

                          if (checkController.noVal.value) {
                            names.add("Stand");
                          } else {
                            names.remove("Stand");
                          }
                        },
                      ),
                      name: "Stand",
                      ontap: () {
                        checkController.noVal.value =
                            !checkController.noVal.value;
                        if (checkController.noVal.value) {
                          names.add("Stand");
                        } else {
                          names.remove("Stand");
                        }
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
                                  if (checkController.noVal.value) {
                                    images.add(imageContoller.standBase64Image
                                        .toString());
                                  } else {
                                    images.remove(imageContoller
                                        .standBase64Image
                                        .toString());
                                  }
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

                                    if (secondaryFtnController
                                            .standValue.value ==
                                        "good") {
                                      values.add("good");
                                      // values.remove("bad");
                                    }
                                    print("here is ws value" +
                                        secondaryFtnController
                                            .standValue.value +
                                        values.toString());
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  // width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.standValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .standHandleButtonClick(value!);
                                    if (secondaryFtnController
                                            .standValue.value ==
                                        "good") {
                                      values.add("good");
                                      // values.remove("bad");
                                    }
                                    print("here is ws value" +
                                        secondaryFtnController
                                            .standValue.value +
                                        values.toString());
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .standHandleButtonClick("bad");

                                    if (secondaryFtnController
                                            .standValue.value ==
                                        "bad") {
                                      values.add("bad");
                                      // values.remove("good");
                                    }

                                    print("here is ws value" +
                                        secondaryFtnController
                                            .standValue.value +
                                        values.toString());
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  // width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.standValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .standHandleButtonClick(value!);

                                    if (secondaryFtnController
                                            .standValue.value ==
                                        "bad") {
                                      values.add("bad");
                                      // values.remove("good");
                                    }

                                    print("here is ws value" +
                                        secondaryFtnController
                                            .standValue.value +
                                        values.toString());
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
                      width: 164.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.yesVal,
                        onChanged: (value) {
                          checkController.yesVal.value = value;
                          if (checkController.yesVal.value) {
                            names.add("Promotion Area");
                          } else {
                            names.remove("Promotion Area");
                          }
                        },
                      ),
                      name: "Promotion Area",
                      ontap: () {
                        checkController.yesVal.value =
                            !checkController.yesVal.value;

                        if (checkController.yesVal.value) {
                          names.add("Promotion Area");
                        } else {
                          names.remove("Promotion Area");
                        }
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
                                buttonText: "Take a Picture for\n Area",
                                imagePath: imageContoller.areaImage,
                                showImage: imageContoller.areavalue,
                                onTap: () {
                                  imageContoller.promotionAreaImage();
                                  if (checkController.yesVal.value) {
                                    images.add(imageContoller
                                        .promotionalBase64Image
                                        .toString());
                                  } else {
                                    images.remove(imageContoller
                                        .promotionalBase64Image
                                        .toString());
                                  }
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

                                    if (secondaryFtnController
                                            .areaValue.value ==
                                        "good") {
                                      values.add("good");
                                      // values.remove("bad");
                                        }
                                    print("here is ws value" + secondaryFtnController.areaValue.value + values.toString());
                                  },
                                  name: "Good",
                                  color: aquamarine,
                                  value: "good",
                                  // width: 75.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.areaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .areaHandleButtonClick(value!);
                                           if (secondaryFtnController
                                            .areaValue.value ==
                                        "good") {
                                      values.add("good");
                                      // values.remove("bad");
                                        }
                                    print("here is ws value" + secondaryFtnController.areaValue.value + values.toString());
                                
                                  },
                                ),
                                5.w.pw,
                                CustomRadioWidget(
                                  onTap: () {
                                    secondaryFtnController
                                        .areaHandleButtonClick("bad");

                                           if (secondaryFtnController
                                            .areaValue.value ==
                                        "bad") {
                                      values.add("bad");
                                      // values.remove("good");
                                        }
                                    print("here is ws value" + secondaryFtnController.areaValue.value + values.toString());
                                
                                  },
                                  name: "Bad",
                                  color: aquamarine,
                                  value: "bad",
                                  // width: 70.w,
                                  height: 40.h,
                                  groupValue:
                                      secondaryFtnController.areaValue.value,
                                  onChanged: (value) {
                                    secondaryFtnController
                                        .areaHandleButtonClick(value!);

                                           if (secondaryFtnController
                                            .areaValue.value ==
                                        "bad") {
                                      values.add("bad");
                                      // values.remove("good");
                                        }
                                    print("here is ws value" + secondaryFtnController.areaValue.value + values.toString());
                                
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
                  if ((secondaryFtnController.gandulaValue.value != null &&
                          imageContoller.gandulaValue.value != false) ||
                      (secondaryFtnController.floorValue.value != null &&
                          imageContoller.floorValue.value != false) ||
                      (secondaryFtnController.standValue.value != null &&
                          imageContoller.standValue.value != false) ||
                      (secondaryFtnController.areaValue.value != null &&
                          imageContoller.secondaryPromValue.value != false)) {
              
                 for( var i = 0; i < names.length; i++){
                   secondaryFtnController.promotionSecondaryFtnStoringID([
                      {
                        "table_name": 'promotion_secondary',
                        "retailerid": storingIDController.retailerid.value,
                        "branchid": storingIDController.branchid.value,
                        "customerid": storingIDController.custmoreid.value,
                        "categoryid  ": storingIDController.categoryid.value,
                        "priceProductid": storingIDController.priceProductID.value,
                        "name": names[i],
                        "image": images[i],
                        "value": values[i],
                        
                      }
                    ]);
                   
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
                    // } else {
                    //   Get.snackbar("faild", "please Select something",
                    //       snackPosition: SnackPosition.BOTTOM,
                    //       backgroundColor: aquamarine);
                    // }
                  }
                  // else{
                  //   Get.snackbar("faild", "please Select GOOD/BAD and Take a Picture",
                  //         snackPosition: SnackPosition.BOTTOM,
                  //         backgroundColor: aquamarine);
                  // }
                })
          ],
        ),
      ),
    );
  }
}
