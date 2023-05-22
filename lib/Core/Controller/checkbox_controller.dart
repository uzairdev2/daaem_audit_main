import 'package:get/get.dart';

class CheckController extends GetxController {
  RxBool yesValue = false.obs;
  RxBool noValue = false.obs;
  RxString genderRadioBtnVal = "".obs;

  RxString selectRadioBtnVal = "".obs;

  handleYesorNoChange(String gernder) {
    selectRadioBtnVal.value = gernder;
  }
}
