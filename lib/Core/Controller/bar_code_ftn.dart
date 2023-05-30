import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  RxString barcode = ''.obs;
  RxBool barValueCheck = false.obs;

  Future<void> scanBarcode(String apiBarcode) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // Custom color for the scanner overlay
      'Cancel', // Text for the cancel button
      true, // Enable flash option
      ScanMode
          .DEFAULT, // Scan mode (barcode, QR code, or all supported formats)
    );

    if (barcodeScanRes != '-1') {
      barcode.value = barcodeScanRes;
      if (barcode == apiBarcode) {
        barValueCheck.value = true;
      } else {
        barValueCheck.value = true;
      }

      update();
    } else {
      // No barcode scanned
      barcode.value = 'Barcode cannot be scanned';
    }
  }
}
