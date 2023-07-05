// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:daaem_reports/Core/Utils/customButton.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../API,s Intergartion/API,s.dart';
import '../Constant/Colors/colors.dart';
import '../Constant/Images/images.dart';
import '../Controller/controller_detail.dart';
import 'custom_text.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var Data = "";
  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiClass>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
        ),
        child: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            menu,
            height: 17.h,
            width: 35.84.w,
          ),
        ),
      ),
      title: CustomText(
        name: "Daaem Reports",
        size: 18.sp,
        weightFont: FontWeight.w700,
      ),
      centerTitle: true,
      actions: [
<<<<<<< HEAD
        Row(
          children: [
            Obx(
              () => CustomButton(
                name: "Send ",
                size: 14.sp,
                width: 45.w,
                height: 27.h,
                color: storingIDController.isDatabaseEmpty.value == false
                    ? grey
                    : red,
                ontap: () async {
                  await printIdController.planogramDbHive();
                  await printIdController.cleaningDbHive();
                  await printIdController.neighborsDBHive();
                  await printIdController.product_Details();
                  await printIdController.priceLabelDbHive();
                  await printIdController.promotionSecondaryDbHive();
                  await printIdController.competitorPromotionDbHive();
                  await printIdController.newItemDbHive();
                  await printIdController.moreSpaceDbHive();

                  //remining
                  await printIdController.poitnOfSaleMaterailDB();

                  print(
                      "here is  outer data ==> ${printIdController.productDetails}");
                  print(
                      "here is  outer competitorPromotion data ==> ${printIdController.competitorPromotion}");

                  List convertedList = printIdController.productDetails.values
                      .map((innerMap) => innerMap.cast<String, dynamic>())
                      .toList();
                  List convertedListPL = printIdController.priceLabel.values
                      .map((innerMap) => innerMap.cast<String, dynamic>())
                      .toList();
                  List convertedListPS = printIdController
                      .promotionSecondary.values
                      .map((innerMap) => innerMap.cast<String, dynamic>())
                      .toList();
                  List convertedListCM = printIdController
                      .competitorPromotion.values
                      .map((innerMap) => innerMap.cast<String, dynamic>())
                      .toList();
                  List convertedListpointOFsales = printIdController
                      .pointOfSaleMaterial.values
                      .map((innerMap) => innerMap.cast<String, dynamic>())
                      .toList();

                  convertedList.add(printIdController.planogramMap);
                  convertedList.add(printIdController.cleaningMap);
                  convertedList.add(printIdController.neighborsMap);
                  convertedList.add(printIdController.newitem);
                  convertedList.add(printIdController.moreSpace);
                  convertedList.addAll(convertedListPL);
                  convertedList.addAll(convertedListPS);
                  convertedList.addAll(convertedListCM);
                  convertedList.addAll(convertedListpointOFsales);

                  print('Converted full  List: $convertedList');
                  // print('Converted List length: ${convertedListCM.length}');
                  for (int i = 0; i < convertedList.length; i++) {
                    await apiData.syncData(
                      MapData: printIdController.moreSpace,
                    );
                  }
                },
              ),
            ),
            10.w.pw,
            CustomButton(
              name: "clear ",
              size: 14.sp,
              width: 45.w,
              height: 27.h,
              ontap: () {
                Get.dialog(AlertDialog(
                  title: CustomText(
                    name: "Are You sure to delete The Hive Data",
                    alignment: TextAlign.center,
                    size: 16,
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        name: "yes",
                        height: 30.h,
                        width: 50.w,
                        ontap: () async {
                          await storingIDController.clearBoxData();
                          Get.back();
                          Get.snackbar("Successfully", "Data has been Clear",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: white);
                        },
                      ),
                      20.w.pw,
                      CustomButton(
                        name: "no",
                        height: 30.h,
                        width: 50.w,
                        ontap: () {
                          Get.back();
                        },
                      )
                    ],
                  ),
                  actions: [],
                ));
              },
            )
          ],
=======
        Obx(
          () => CustomButton(
            name: "Send ",
            size: 14.sp,
            width: 65.w,
            height: 30.h,
            color:
                storingIDController.isDatabaseEmpty.value == false ? grey : red,
            ontap: () async {
              // await printIdController.planogramDbHive();
              // await printIdController.cleaningDbHive();
              // await printIdController.neighborsDBHive();
              // await printIdController.product_Details();
              // await printIdController.priceLabelDbHive();
              // await printIdController.promotionSecondaryDbHive();
              // await printIdController.competitorPromotionDbHive();
              // await printIdController.newItemDbHive();
              // await printIdController.moreSpaceDbHive();

              // //remining
              await printIdController.poitnOfSaleMaterailDB();

              // print(
              //     "here is  outer data ==> ${printIdController.productDetails}");
              // print(
              //     "here is  outer competitorPromotion data ==> ${printIdController.competitorPromotion}");

              // List convertedList = printIdController.productDetails.values
              //     .map((innerMap) => innerMap.cast<String, dynamic>())
              //     .toList();
              // List convertedListPL = printIdController.priceLabel.values
              //     .map((innerMap) => innerMap.cast<String, dynamic>())
              //     .toList();
              // List convertedListPS = printIdController.promotionSecondary.values
              //     .map((innerMap) => innerMap.cast<String, dynamic>())
              //     .toList();
              // List convertedListCM = printIdController
              //     .competitorPromotion.values
              //     .map((innerMap) => innerMap.cast<String, dynamic>())
              //     .toList();
              List convertedListpointOFsales = printIdController
                  .pointOfSaleMaterial.values
                  .map((innerMap) => innerMap.cast<String, dynamic>())
                  .toList();

              // convertedList.add(printIdController.planogramMap);
              // convertedList.add(printIdController.cleaningMap);
              // convertedList.add(printIdController.neighborsMap);
              // convertedList.add(printIdController.newitem);
              // convertedList.add(printIdController.moreSpace);
              // convertedList.addAll(convertedListPL);
              // convertedList.addAll(convertedListPS);
              // convertedList.addAll(convertedListCM);
              // convertedList.addAll(convertedListpointOFsales);

              print('Converted full  List: $convertedListpointOFsales');

    for (int i = 0; i < convertedListpointOFsales.length; i++) {
                await apiData.syncData(
                  MapData: convertedListpointOFsales[i],
                );
              }
            },
          ),
>>>>>>> fdf38fc3c3a444d1598c20bec4c4a185136d11ed
        ),
        10.h.pw
      ],
    );
  }
}
