import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/common_dialogue.dart';

class HomeScreenController extends GetxController {
  final commonDialog = CommonDialog().obs;
  final selectedRetailer = Rx<String?>(null);
  RxString? selectedCategory = "".obs;

  final selectedStore = Rx<String?>(null);
  final showButtons = RxBool(false);

  List<DropdownMenuItem<String>>? getStorName(String retailer) {
    switch (retailer) {
      case 'Panda':
        return const [
          DropdownMenuItem<String>(
            value: 'Othaim 116',
            child: Text('Othaim 116'),
          ),
          DropdownMenuItem<String>(
            value: 'Othaim 49',
            child: Text('Othaim 49'),
          ),
          DropdownMenuItem<String>(
            value: 'Panda 10004',
            child: Text('Panda 10004'),
          ),
        ];
      case 'Nesto':
        return const [
          DropdownMenuItem<String>(
            value: 'Othaim 116',
            child: Text('Othaim 116'),
          ),
          DropdownMenuItem<String>(
            value: 'Othaim 49',
            child: Text('Othaim 49'),
          ),
          DropdownMenuItem<String>(
            value: 'Panda 10004',
            child: Text('Panda 10004'),
          ),
        ];
      case 'Othaim':
        return const [
          DropdownMenuItem<String>(
            value: 'Othaim 116',
            child: Text('Othaim 116'),
          ),
          DropdownMenuItem<String>(
            value: 'Othaim 49',
            child: Text('Othaim 49'),
          ),
          DropdownMenuItem<String>(
            value: 'Panda 10004',
            child: Text('Panda 10004'),
          ),
        ];
      default:
        return null;
    }
  }

  void onCountryChanged(String? newValue) {
    selectedRetailer.value = newValue;
    selectedStore.value = null;
  }

  void onCityChanged(String? newValue) {
    selectedStore.value = newValue;
  }

  // void onStoreChanged(String? newValue) {
  //   selectedStore.value = newValue;
  //   showButtons.value = true;
  // }
}

class CategorySelctedController extends GetxController {
  var selectedValue = "".obs;
  final selectedRetailer = Rx<String?>(null);
  var visibilityValue = false.obs;
  var visibilityValue2 = true.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  visibilityTrue() {
    visibilityValue.value = true;
  }

  visibilityTrue2() {
    visibilityValue2.value = !visibilityValue2.value;
  }
}
