import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_text.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String barcode = '';

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // Custom color for the scanner overlay
      'Cancel', // Text for the cancel button
      true, // Enable flash option

      ScanMode
          .DEFAULT, // Scan mode (barcode, QR code, or all supported formats)
    );

    if (!mounted) return;

    setState(() {
      if (barcodeScanRes != '-1') {
        // Barcode successfully scanned
        barcode = barcodeScanRes;
      } else {
        // No barcode scanned
        barcode = 'Barcode cannot be scanned';
      }
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: barcode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                ontap: scanBarcode,
                name: 'Start Scanning',
                color: red,
                height: 45.h,
                width: 250.w,
              ),
              10.h.ph,
              Visibility(
                visible: barcode.isNotEmpty,
                child: Column(
                  children: [
                    const Divider(
                      color: grey,
                      thickness: 0.5,
                    ),
                    15.h.ph,
                    CustomText(
                      name: 'Scanned Result:',
                      color: grey,
                      size: 16.sp,
                    ),
                    10.h.ph,
                    CustomText(
                      name: barcode,
                      size: 16.sp,
                      weightFont: FontWeight.w600,
                    ),
                    20.h.ph,
                    CustomButton(
                      ontap: copyToClipboard,
                      name: 'Copy',
                      color: aquamarine,
                      height: 45.h,
                      width: 250.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
