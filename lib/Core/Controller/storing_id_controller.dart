// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'database_name/db_name.dart';

class StoringIDController extends GetxController {
  RxString retailerid = "".obs;
  RxString branchid = "".obs;
  RxString custmoreid = "".obs;
  RxString categoryid = "".obs;
  RxString productID = "".obs;
  RxString priceProductID = "".obs;
  RxString barcode = "".obs;
  RxString quantity = "".obs;

  RxString leftvalue = "".obs;
  RxString rightvalue = "".obs;
  List osaList = [];
  List pricing = [];
  List stockLevel = [];
  List accessible = [];

  RxString cleanessValue = "".obs;
  RxString nabiursValue = "".obs;
  RxString itemName = "".obs;
  RxString text = "".obs;
  RxString nameOfpromosite = "".obs;

  RxString itemPrice = "".obs;
  RxString expiryItem = "".obs;
  RxString morespaceExpire = "".obs;
  RxString discriptionOfitem = "".obs;
  String pricelabelValue = "";
  String locationValue = "";
  RxString promotionValue = "".obs;
  final RxBool isDatabaseEmpty = false.obs;

  checkingHive() async {
    final box = await Hive.openBox('planogramData');
    final box2 = await Hive.openBox('cleaningData');
    final box3 = await Hive.openBox('naboursData');
    final box4 = await Hive.openBox('osaData');
    final box5 = await Hive.openBox('pricingData');
    final box6 = await Hive.openBox('stockLevelData');
    final box7 = await Hive.openBox('accessibleData');
    final box8 = await Hive.openBox('priceLabelData');
    final box9 = await Hive.openBox('locationData');
    final box10 = await Hive.openBox('promotionData');
    final box11 = await Hive.openBox('newItemData');
    final box12 = await Hive.openBox('moreSpaceData');
    final box13 = await Hive.openBox('saleMaterialData');

    if (box.isEmpty &&
        box2.isEmpty &&
        box3.isEmpty &&
        box4.isEmpty &&
        box5.isEmpty &&
        box6.isEmpty &&
        box7.isEmpty &&
        box8.isEmpty &&
        box9.isEmpty &&
        box10.isEmpty &&
        box11.isEmpty &&
        box12.isEmpty &&
        box13.isEmpty) {
      await box.close();
      await box2.close();
      await box3.close();
      await box4.close();
      await box5.close();
      await box6.close();
      await box7.close();
      await box8.close();
      await box9.close();
      await box10.close();
      await box11.close();
      await box12.close();
      await box13.close();
      isDatabaseEmpty.value = false;
    } else {
      isDatabaseEmpty.value = true;
      await box.close();
      await box2.close();
      await box3.close();
      await box4.close();
      await box5.close();
      await box6.close();
      await box7.close();
      await box8.close();
      await box9.close();
      await box10.close();
      await box11.close();
      await box12.close();
      await box13.close();
    }
  }

  clearBoxData() async {
    final box = await Hive.openBox('planogramData');
    final box2 = await Hive.openBox('cleaningData');
    final box3 = await Hive.openBox("neighborsData");
    final box4 = await Hive.openBox('osaData');
    final box5 = await Hive.openBox(promotionSecondarydb);
    final box6 = await Hive.openBox(priceLabelDb);
    final box7 = await Hive.openBox(newItemDb);
    final box8 = await Hive.openBox(moreSpaceDb);
    final box9 = await Hive.openBox(competitorPromotionDb);
    final box10 = await Hive.openBox("competitor_material");

    box.clear();
    box2.clear();
    box3.clear();
    box4.clear();
    box5.clear();
    box6.clear();
    box7.clear();
    box8.clear();
    box9.clear();
    box10.clear();

    await box.close();
    await box2.close();
    await box3.close();
    await box4.close();
    await box5.close();
    await box6.close();
    await box7.close();
    await box8.close();
    await box9.close();
    await box10.close();

    log("clear all data");
  }

/////////////////// Neighbors //////////////////////

  Future<void> neighborsFtnStoringID(
      String leftdropValue, String rightDropVlaue) async {
    final boxname = await Hive.openBox("neighborsData");

    boxname.put("tablename", "neighborsData");
    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put("leftDropValue", leftdropValue);
    boxname.put("rightDropVaalue", rightDropVlaue);
  }

  Future<void> neighborsFtnGetingID() async {
    final boxname = await Hive.openBox("neighborsData");

    retailerid.value = boxname.get("retailerid");
    branchid.value = boxname.get("branchid");
    custmoreid.value = boxname.get("custmoreid");
    categoryid.value = boxname.get("categoryid");
    leftvalue.value = boxname.get("leftDropValue");
    rightvalue.value = boxname.get("rightDropVaalue");

    log("here is retailer id $retailerid");
    log("here is branch id $branchid");
    log("here is custmore id $custmoreid");
    log("here is category id $categoryid");
    log("here is left drop value ${leftvalue.value}");
    log("here is right drop value ${rightvalue.value}");
  }

  Future<void> clearHiveBox(String boxName) async {
    final box = await Hive.openBox(boxName);

    await box.clear();

    await box.close();
  }

/////////////////////////////// OSA ////////////////////////////////////////
  Future<void> osaFtnStoringID(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("osaData");

    boxname.addAll(dataList);
    var data = boxname.values.toList();
    for (var item in data) {
      // Process the item as needed
      print(item);
    }
  }

///////////price/////////

  Future<void> pricingPutData(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("pricingData");

    boxname.addAll(dataList);
  }

  Future<Box> priceopenBox() async {
    final box = await Hive.openBox('pricingData');
    return box;
  }

  Future<void> pricingGetData() async {
    final box = await priceopenBox();

    pricing = box.values.toList();

    log("here is price data list ${pricing.length}");
    log("here is price data list $pricing");
  }

////////// stock //////////

  Future<void> stockLevelPutData(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("stockLevel");

    boxname.addAll(dataList);
  }

  Future<Box> stockLevelopenBox() async {
    final box = await Hive.openBox('stockLevel');
    return box;
  }

  Future<void> stockLevelGetData() async {
    final box = await stockLevelopenBox();
    stockLevel = box.values.toList();
    log("here is price data list ${stockLevel.length}");
    log("here is price data list $stockLevel");
  }

  Future<void> accessiblePutData(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("accessible");

    boxname.addAll(dataList);
  }

  Future<Box> accessibleopenBox() async {
    final box = await Hive.openBox('accessible');
    return box;
  }

  Future<void> accessibleGetData() async {
    // final boxname = await Hive.openBox("osaData");

    // final box1 = Hive.openBox('osaData');
    final box = await accessibleopenBox();
    // List dataList = [];

    accessible = box.values.toList();

    log("here is osa data list ${accessible.length}");
    log("here is osa data list $accessible");
  }

  Future<void> priceLabelFtnStoringID() async {
    final boxname = await Hive.openBox("priceLabelData");

    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put(
      "priceLabelValue",
      checkController.selectRadioBtnVal.value,
    );
  }

  priceLabelFtnGetingIDs() async {
    final boxname = await Hive.openBox("priceLabelData");

    retailerid.value = boxname.get("retailerid");
    branchid.value = boxname.get("branchid");
    custmoreid.value = boxname.get("custmoreid");
    categoryid.value = boxname.get("categoryid");
    pricelabelValue = boxname.get("priceLabelValue");

    log("here is retailer id $retailerid");
    log("here is branch id $branchid");
    log("here is custmore id $custmoreid");
    log("here is category id $categoryid");
    log("here is priceLabel value ${checkController.selectRadioBtnVal.value}");
  }

  Future<void> locationFtnStoringID() async {
    final boxname = await Hive.openBox("locationData");
    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put(
      "locationValue",
      checkController.selectRadioBtnVal.value,
    );
  }

  locationFtnGetingIDs() async {
    final boxname = await Hive.openBox("locationData");
    retailerid.value = boxname.get("retailerid");
    branchid.value = boxname.get("branchid");
    custmoreid.value = boxname.get("custmoreid");
    categoryid.value = boxname.get("categoryid");
    locationValue = boxname.get("locationValue");

    log("here is retailer id $retailerid");
    log("here is branch id $branchid");
    log("here is custmore id $custmoreid");
    log("here is category id $categoryid");
    log("here is location value ${checkController.selectRadioBtnVal.value}");
  }

  Future<void> promotionFtnStoringID() async {
    final boxname = await Hive.openBox("promotionData");
    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put(
      "promotionValue",
      checkController.selectRadioBtnVal.value,
    );
  }

  promotionFtnGetingIDs() async {
    final boxname = await Hive.openBox("promotionData");
    retailerid.value = boxname.get("retailerid");
    branchid.value = boxname.get("branchid");
    custmoreid.value = boxname.get("custmoreid");
    categoryid.value = boxname.get("categoryid");
    promotionValue = boxname.get("promotionValue");

    log("here is retailer id $retailerid");
    log("here is branch id $branchid");
    log("here is custmore id $custmoreid");
    log("here is category id $categoryid");
    log("here is promotion value ${checkController.selectRadioBtnVal.value}");
  }

  Future<void> newItemFtnStoringID() async {
    final boxname = await Hive.openBox("newItemData");
    boxname.put("itemName", itemName.value);
    boxname.put("itemPrice", itemPrice.value);
    boxname.put("itemExpiry", expiryItem.value);
    boxname.put("itemDiscription", discriptionOfitem.value);
  }

  newItemFtnGetingIDs() async {
    final boxname = await Hive.openBox("newItemData");
    itemName.value = boxname.get("itemName");
    itemPrice.value = boxname.get("itemPrice");
    expiryItem.value = boxname.get("itemExpiry");
    discriptionOfitem.value = boxname.get("itemDiscription");

    log("here is itemName  $itemName");
    log("here is itemPrice  $itemPrice");
    log("here is expiryItem  $expiryItem");
    log("here is discriptionOfitem  $discriptionOfitem");
  }

  Future<void> moreSpaceFtnStoringID() async {
    final boxname = await Hive.openBox("moreSpaceData");
    boxname.put("moreSpaceExpiry", morespaceExpire.value);
  }

  moreSpaceFtnGetingIDs() async {
    final boxname = await Hive.openBox("moreSpaceData");
    itemName.value = boxname.get("moreSpaceExpiry");
    log("here is More space Expiry  $morespaceExpire");
  }

  Future<void> saleMaterialFtnStoringID() async {
    final boxname = await Hive.openBox("saleMaterialData");
    boxname.put("text", text.value);
    boxname.put("nameOfpromosite", nameOfpromosite.value);
  }

  saleMaterialFtnGetingIDs() async {
    final boxname = await Hive.openBox("saleMaterialData");
    text.value = boxname.get("text");
    nameOfpromosite.value = boxname.get("nameOfpromosite");
    log("here isText  $text");
    log("here is name Of promosite $morespaceExpire");
  }

  Future<void> scanProduct(barcode, quantity) async {
    final boxname = await Hive.openBox("scanProduct");

    boxname.put("barcode", barcode);
    boxname.put("quantity", quantity);
  }

  List<Map<String, dynamic>> scannedProducts = [];
  getscanProduct() async {
    final boxname = await Hive.openBox("scanProduct");

    barcode.value = boxname.get("barcode");
    quantity.value = boxname.get("quantity");
    scannedProducts.add({
      "barcode": barcode.value,
      "quantity": quantity.value,
    });
  }
}
