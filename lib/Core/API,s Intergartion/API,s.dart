// ignore_for_file: avoid_print, file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:daaem_reports/Core/Model/API,s%20Models/retailer_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/branch_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Feature/Home Screen.dart/home_screen.dart';
import '../Constant/Colors/colors.dart';
import '../Model/API,s Models/category_model.dart';
import '../Model/API,s Models/customer_model.dart';
import '../Model/API,s Models/product_model.dart';

import '../Utils/customButton.dart';
import '../Utils/customText.dart';

String extractValueFromBody(String responseBody) {
  var jsonData = json.decode(responseBody);
  var value = jsonData[0]['merchandiser_id'].toString();
  return value;
}

class ApiClass with ChangeNotifier {
  // reatiler_model firstmodel = reatiler_model();
  List<RetailerModel> reatilerlist = [];
  List<BranchModel> branchList = [];
  List<CustomerModel> customerList = [];
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<ModelScan> scanProduct = [];
  var selectedCategoryId = '';
  var selectedProductId = '';
  var Data = "";
  List<RetailerModel> firstlist = [];
  String merchandiser_id = "";

  syncData({required Map<String, dynamic> MapData}) async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/web_api/insert/');

    print("my data is  inner  $MapData");

    Map<String, dynamic> dataMap = {};

    if (MapData['table_name'] == "planogram") {
      dataMap = {
        "action": "planogram",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "planogramValue": MapData['planogramValue'],
      };
    } else if (MapData['table_name'] == "cleaning") {
      dataMap = {
        "action": "cleaning",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "image": MapData['imagedata'],
        "cleaningValue": MapData['cleaningValue'],
      };
    } else if (MapData['table_name'] == "neighbours") {
      dataMap = {
        "action": "neighbours",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "left_id": MapData['leftDropValue'],
        "right_id": MapData['rightDropVaalue'],
      };
    } else if (MapData['table_name'] == "product_detail") {
      dataMap = {
        "action": MapData['table_name'],
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "product_id": MapData['productId'],
        "osa": MapData['osa'] as String?,
        "price_label": MapData['pricevalue'],
        "stock_level": MapData['stockvalue'],
        "accessable": MapData['accessible'],
        "image": MapData['imagedata'],
      };
    } else if (MapData['table_name'] == "newItem") {
      dataMap = {
        "action": "newitem",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['customerid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "itemWeight": MapData['itemWeight'],
        "itemPrice": MapData['itemPrice'],
        "itemName": MapData['itemName'],
        "competitor_id": "116",
        "itemDescription": MapData['itemDiscription'],
      };
    } 
    else if(MapData['table_name'] == "moreSpace"){
      dataMap = {
        "action": "morespace",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['customerid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "note_text": MapData['note'],
        "competitor_id": "612",
        "image": MapData['moreSpacePicture'],
      };
    }
    else if (MapData['table_name'] == "promotion_price") {
      dataMap = {
        "action": "promotion_price",
        "retailer_id": MapData['retailerid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "branch_id": MapData['branchid'],
        "regular_price": MapData['regularPrice'],
        "promotion_price": MapData['promotonalPrice'],
        "price_label": MapData['priceLabelValue'],
        "product_id": MapData['priceProductid'],
        "priceImage": MapData['priceImage'],
      };
    } 
    //today
    else if (MapData['table_name'] == "promotion_secondary") {
      dataMap = {
        "action": "promotion_secondary",
        "retailer_id": MapData['retailerid'],
        "branch_id": MapData['branchid'],
        "customer_id": MapData['customerid'],
        "category_id": MapData['categoryid  '],
        "product_id": MapData['priceProductid'],
        "name": MapData['name'],
        "value": MapData['value'],
        // "image": MapData['image'],
        "image": "",
      };
    } else if (MapData['table_name'] == "competitor_promotion") {
      dataMap = {
        "action": "competitor_promotion",
        "retailer_id": MapData['retailerid'],
        "branch_id": MapData['branchid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "product_id": MapData['competitorPromotionProductid'],
        "regular_price": MapData['regularPrice'],
        "promotion_price": MapData['promotonalPrice'],
        "competitor_id": "346",
        "image": "",
      };
    } else if (MapData['table_name'] == "Competitior_material") {
      dataMap = {
        "action": "Competitior_material",
        "retailer_id": MapData['retailerid'],
        "branch_id": MapData['branchid'],
        "customer_id": MapData['custmoreid'],
        "category_id": MapData['categoryid'],
        "otherMaterialName": MapData['otherMaterialName'],
        "notes": MapData['notes'],
        "image": MapData["image"],
      };
    }

    print("here is data map map $dataMap");

    var response = await http.post(
      url,
      // body: planogramData,
      // body: cleanessData,
      // body: neighborData,
      body: dataMap,
    );
    if (response.statusCode == 200) {
      print('Request status 200');
      print("respon.body${response.body}");
      // var responseData = json.decode(response.body);
      // print(responseData);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> setCategoryId(String id) async {
    selectedCategoryId = id;
  }

  Future<void> setProductId(String id) async {
    selectedProductId = id;
  }

  againsearch() {
    branchList = [];
    print("here is branch list ${branchList.length}");
    notifyListeners();
  }

  Future<void> getRetailerData({String? merchandiser_id}) async {
    final body = {'merchandiser_id': merchandiser_id};
    String url =
        'https://www.daaemsolutions.com/test/audit_api/retailer/'; // Replace with your API endpoint
    final response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == 200) {
      Data = response.body;

      final List<dynamic> responseData = json.decode(response.body);

      for (var i = 0; i < responseData.length; i++) {
        reatilerlist.add(RetailerModel.fromJson(responseData[i]));
        notifyListeners();
      }

      print(reatilerlist.length.toString());
      print("here is data ${responseData[0]["retailer_name"]}");
      notifyListeners();
      // log("here is data ${firstmodel.retailerName!.length}");
    } else {
      // API request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  loginUser({required String username, required String password}) async {
    print("$username and $password");
    final formData = {
      'username': username,
      'password': password,
    };
    String url =
        'https://www.daaemsolutions.com/test/audit_api/login/'; // Replace with your API endpoint
    http
        .post(
      Uri.parse(url),
      body: formData,
    )
        .then((value) async {
      if (value.statusCode == 200) {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString('username', username);
        Get.defaultDialog(
            title: 'Loading...',
            content: const CircularProgressIndicator(
              color: black,
              strokeWidth: 2.2,
              backgroundColor: Colors.orange,
            ));
      } else {
        Get.defaultDialog(
          title: "error",
          content: CustomText(
            name: "Please enter your create username and password",
            color: black,
            size: 14.sp,
            weightFont: FontWeight.w700,
          ),
          confirm: CustomButton(
            name: "go back",
            ontap: () {
              Get.back();
            },
          ),
        );
      }
      if (value.statusCode == 200) {
        // Login successful
        print('Login successful! ${value.body}');
        String responseBody = value.body;
        String merchandiserId = extractValueFromBody(responseBody);
        print('Merchandiser ID: $merchandiserId');
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString('merchandiserId', merchandiserId);
        merchandiser_id = merchandiserId;

        getRetailerData(merchandiser_id: merchandiserId).then((value) {
          Get.offAll(() => const HomeScreen());
        });
      } else {
        // Login failed
        print('Login failed! $value');

        print('Login failed. Error: ${value.statusCode}');
      }
    }).catchError((e) {
      print('Error during login: $e');
    });
  }

  Future<void> getBranchData(
      {required String retailer_id, required String merchandiser_id}) async {
    final body = {
      'merchandiser_id': merchandiser_id,
      'retailer_id': retailer_id,
    };
    const url =
        'https://www.daaemsolutions.com/test/audit_api/branch/'; // Replace with your API endpoint
    final response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == 200) {
      Data = response.body;

      final List<dynamic> responseData = json.decode(response.body);

      for (var i = 0; i < responseData.length; i++) {
        branchList.add(BranchModel.fromJson(responseData[i]));
        notifyListeners();
      }
      notifyListeners();

      print(branchList.length.toString());
      // log("here is data ${responseData[0]["retailer_name"]}");
      // log("here is data ${firstmodel.retailerName!.length}");
    } else {
      // API request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> getCustomerData() async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/customers/'); // Replace with your API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Data = response.body;

      final List<dynamic> responseData = json.decode(response.body);

      for (var i = 0; i < responseData.length; i++) {
        customerList.add(CustomerModel.fromJson(responseData[i]));
        notifyListeners();
      }
      notifyListeners();

      print(customerList.length.toString());
      // log("here is data ${responseData[0]["retailer_name"]}");
      // log("here is data ${firstmodel.retailerName!.length}");
    } else {
      // API request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> getProductData({required String customerid}) async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/category/?customer_id=$customerid'); // Replace with your API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Data = response.body;

      final List<dynamic> responseData = json.decode(response.body);

      for (var i = 0; i < responseData.length; i++) {
        categoryList.add(CategoryModel.fromJson(responseData[i]));
        notifyListeners();
      }
      notifyListeners();

      print('Category List: ${categoryList.length.toString()}');
      // log("here is data ${responseData[0]["retailer_name"]}");
      // log("here is data ${firstmodel.retailerName!.length}");
    } else {
      // API request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> getCategoryData({required String categoryid}) async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/products/?category_id=$categoryid'); // Replace with your API endpoint
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Data = response.body;

      final List<dynamic> responseData = json.decode(response.body);

      for (var i = 0; i < responseData.length; i++) {
        productList.add(ProductModel.fromJson(responseData[i]));
        notifyListeners();
      }
      notifyListeners();

      print('Product List: ${productList.length.toString()}');
      print('Product List1: ${productList[0].productName}');
      print('Product List2: ${productList[0].barcode}');
      print('Product List3: ${productList[0].productId}');
    } else {
      // API request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  String apiUrl = 'https://www.daaemsolutions.com/daaem/app/msl.php';

  Future<void> scanProducts(String customerid, String branchid) async {
    print("function is called");
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'customer_id': customerid,
          'branch_id': branchid,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseList = json.decode(response.body);
        for (var i = 0; i < responseList.length; i++) {
          scanProduct.add(ModelScan.fromJson(responseList[i]));
          notifyListeners();
        }
        notifyListeners();
        print(scanProduct.length);
        print(scanProduct[0].code.toString());
        print(scanProduct[0].productId.toString());
      } else {
        // Login failed
        print('Login failed. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }
}
