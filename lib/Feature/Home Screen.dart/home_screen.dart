// ignore_for_file: must_be_immutable

import 'dart:developer';

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
import '../../Core/Local DB/model.dart';
import '../../Core/Local DB/openBox.dart';
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
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);
    // ignore: avoid_print
    print("hi");

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
                              logPro.againsearch();
                              await logPro.getBranchData(
                                  retailerid: item.retailerId.toString());
                              controller.selectedRetailer.value = "newValue";
                              final storedata = ModelHive(
                                retailerId: item.retailerId.toString(),
                              );
                              final boxes = Boxes.getData();
                              boxes.add(storedata).then((value) {
                                print("idsave");
                              }).onError((error, stackTrace) {
                                Get.snackbar("Error", error.toString());
                              });
                              // setState(() {});
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
                        items: logPro.branchList
                            .map((item) => DropdownMenuItem<String>(
                                  onTap: () async {
                                    print('heeee ${item.branchName}');
                                    // print("here is ${item.branchId}");
                                    await logPro.getCustomerData();
                                    controller.selectedStore.value = "true";
                                    final storedata = ModelHive(
                                      branchId: item.branchId.toString(),
                                    );
                                    final boxes = Boxes.getData();
                                    boxes.add(storedata).then((value) {
                                      print("idsave");
                                    }).onError((error, stackTrace) {
                                      Get.snackbar("Error", error.toString());
                                    });
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
                                                // customerid =
                                                //     item.customerId.toString();

                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                await prefs.setString(
                                                    'customerid',
                                                    item.customerId.toString());
                                                // await logPro.getCategoryData(
                                                //     customerid:
                                                //         item.customerId.toString());
                                                // print(
                                                //     'Customer id: ${item.customerId}');
                                                // print(customerid);
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
                        ontap: () {
                          Get.toNamed(RoutesName.scannerScreen);
                        },
                      ),
                      16.w.pw,
                      CustomButton(
                        width: 155.w,
                        height: 46.h,
                        name: "Instore",
                        ontap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? customerid = prefs.getString('customerid');

                          await logPro
                              .getProductData(customerid: customerid!)
                              .then((value) {
                            return Get.toNamed(RoutesName.categoryScreen);
                          });

                          logPro.categoryList.clear();
                          final storedata = ModelHive(
                            custmoreId: customerid.toString(),
                          );
                          final boxes = Boxes.getData();
                          boxes.add(storedata).then((value) {
                            print("idsave");
                          }).onError((error, stackTrace) {
                            Get.snackbar("Error", error.toString());
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
