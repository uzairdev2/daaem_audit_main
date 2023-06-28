// ignore_for_file: must_be_immutable, unnecessary_null_comparison, unused_local_variable, avoid_print

import 'dart:developer';
import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:daaem_reports/Core/Routes/routes_name.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/API,s Intergartion/API,s.dart';
import '../../Core/Controller/dropdown_controller.dart';

import '../../Core/Utils/common_scaffold.dart';
import '../../Core/Utils/custom_button.dart';
import 'Common Widgets/custom_dropdown_button.dart';
import 'Common Widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(storingIDController.isDatabaseEmpty.value);
    storingIDController.checkingHive();
  }

  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);
    return GetX<HomeScreenController>(
        init: controller,
        builder: (_) {
          return CommonScaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: 'Retailers'),
                10.h.ph,
                CustomDropdown(
                  hint: 'Select a Retailer',
                  isDense: true,
                  isExpanded: true,
                  items: logPro.reatilerlist
                      .map((item) => DropdownMenuItem<String>(
                            onTap: () async {
                              print("here is ${item.retailerId}");
                              //call your Scond api here
                              logPro.branchList.clear();
                              logPro.againsearch();
                              final SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              String merchId = sharedPreferences
                                  .getString("merchandiserId")
                                  .toString();
                              log("here is ${merchId}");
                              await logPro.getBranchData(
                                  merchandiser_id: merchId,
                                  retailer_id: item.retailerId.toString());
                              controller.selectedRetailer.value = "newValue";
                              storingIDController.retailerid.value =
                                  item.retailerId!;
                            },
                            value: item.retailerName,
                            child: Text(
                              item.retailerName.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ))
                      .toList(),
                  customsearch: DropdownSearchData(
                    searchController: search,
                    searchInnerWidgetHeight: 70.h,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: search,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for an retailers...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      log("here is ${item.value.toString()}");
                      return (item.value.toString().contains(searchValue));
                    },
                  ),
                  onChanged: (String? newValue) {
                    // controller.selectedStore.value = null;
                    // controller.sele.value = null;
                  },
                ),
                20.h.ph,
                Visibility(
                  visible: controller.selectedRetailer.value != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(title: 'Branch Names'),
                      10.h.ph,
                      CustomDropdown(
                        hint: 'Select a Branch',
                        isDense: true,
                        isExpanded: true,
                        onChanged: (String? newValue) {},
                        items: logPro.branchList == null ||
                                logPro.branchList.isEmpty
                            ? []
                            : logPro.branchList
                                .map((item) => DropdownMenuItem<String>(
                                      onTap: () async {
                                        print("here is ${item.branchId}");
                                        // log("here is ${item.coordinates}");

                                        // String coordinates = item.coordinates!;
                                        // List<String> coordinateList =
                                        //     coordinates.split(", ");

                                        // String latitude =
                                        //     coordinateList[0]; // 24.746207
                                        // String longitude =
                                        //     coordinateList[1]; // 46.775707

                                        // print("here is latitude $latitude");
                                        // print("here is longitude $longitude");

                                        // double lat = double.parse(latitude);
                                        // double long = double.parse(longitude);

                                        // await checkController.getDistance(
                                        //     lat: lat,
                                        //     lon: long,
                                        //     onConfirm: () async {
                                        //       await logPro.getCustomerData();
                                        //       controller.selectedStore.value =
                                        //           "true";
                                        //       storingIDController.branchid.value =
                                        //           item.branchId!;
                                        //     });

                                        await logPro.getCustomerData();
                                        controller.selectedStore.value = "true";
                                        storingIDController.branchid.value =
                                            item.branchId!;
                                      },
                                      value: item.branchName,
                                      child: Text(
                                        item.branchName.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ))
                                .toList(),
                      ),
                      20.h.ph,
                      Align(
                        alignment: Alignment.center,
                        child: Visibility(
                            visible: checkController.visable.value == true,
                            child: const CircularProgressIndicator(
                              color: red,
                            )),
                      ),
                      Visibility(
                        visible: controller.selectedStore.value != null,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                title: 'Customers',
                              ),
                              10.h.ph,
                              CustomDropdown(
                                hint: 'Select a Customer',
                                isDense: true,
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  controller.selectedStore.value = newValue;
                                  controller.showButtons.value = true;
                                },
                                items: logPro.customerList == null ||
                                        logPro.customerList.isEmpty
                                    ? []
                                    : logPro.customerList
                                        .map((item) => DropdownMenuItem<String>(
                                              onTap: () async {
                                                storingIDController.custmoreid
                                                    .value = item.customerId!;
                                              },
                                              value: item.customerName,
                                              child: Text(
                                                item.customerName.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                15.h.ph,
                Visibility(
                  visible: controller.showButtons.value,
                  child: Row(
                    children: [
                      CustomButton(
                        width: 155.w,
                        height: 46.h,
                        name: "Backdoor",
                        ontap: () async {
                          logPro.scanProduct.clear();
                          await logPro.scanProducts("43", "1").then((value) {
                            Get.toNamed(RoutesName.scannerScreen);
                          });
                        },
                      ),
                      16.w.pw,
                      CustomButton(
                        width: 155.w,
                        height: 46.h,
                        name: "Instore",
                        ontap: () async {
                          await logPro
                              .getProductData(
                                  customerid:
                                      storingIDController.custmoreid.value)
                              .then((value) {
                            return Get.toNamed(RoutesName.categoryScreen);
                          });

                          logPro.categoryList.clear();
                        },
                      )
                    ],
                  ),
                ),
                20.h.ph,
                // CustomButton(
                //     name: "LogOut",
                //     ontap: () async {
                //       SharedPreferences prefs =
                //           await SharedPreferences.getInstance();
                //       prefs.remove('username');
                //       prefs.remove('merchandiserId');
                //       Get.offAll(() => SignIn());
                //     })
              ],
            ),
          );
        });
  }
}
