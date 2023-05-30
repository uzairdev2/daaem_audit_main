import 'package:get/get.dart';

class CheckController extends GetxController {
  RxBool CheckValue1 = false.obs;
  RxBool CheckValue2 = false.obs;

  RxBool radioValue = false.obs;

  RxString selectRadioBtnVal = "".obs;

  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    selectRadioBtnVal.value = gernder;
    print(radioValue);
    // update(); // Toggle the value of the radio button
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    selectRadioBtnVal.value = gernder;
    print(radioValue);
  }
}
