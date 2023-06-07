// ignore_for_file: unnecessary_null_comparison

import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_text.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Core/API,s Intergartion/API,s.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            name: 'QR Scanner',
            weightFont: FontWeight.w700,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomText(
                    name: 'Place the QR code in the area',
                    weightFont: FontWeight.w800,
                    size: 18.sp,
                    color: black,
                  ),
                  10.h.ph,
                  CustomText(
                    name: 'Scanning will be start automatically',
                    size: 14.sp,
                    color: grey,
                  ),
                  50.h.ph,
                  CustomButton(
                    ontap: () {
                      scanController.checkingList(logPro.scanProduct);
                    },
                    name: 'Start Scanning',
                    color: red,
                    height: 45.h,
                    width: 250.w,
                  ),
                  15.h.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          10.w.pw,
                          CustomText(
                            name: "List Of Quantity",
                            size: 16.sp,
                            weightFont: FontWeight.w600,
                            color: black,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          categoryController.visibilityTrue2();
                          storingIDController.getscanProduct();
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
                  Obx(
                    () => Visibility(
                      visible: categoryController.visibilityValue2.value,
                      child: ListView.builder(
                          itemCount: storingIDController.scannedProducts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final product =
                                storingIDController.scannedProducts[index];
                            return ListTile(
                              title:
                                  Text("Customer ID: ${product['customerID']}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Branch ID: ${product['branchID']}"),
                                  Text("Product ID: ${product['productID']}"),
                                  Text("Barcode: ${product['barcode']}"),
                                  Text("Quantity: ${product['quantity']}"),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ]))));
  }
}
