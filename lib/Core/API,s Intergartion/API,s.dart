// ignore_for_file: avoid_print, file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:daaem_reports/Core/Model/API,s%20Models/retailer_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/branch_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/API,s Models/category_model.dart';
import '../Model/API,s Models/customer_model.dart';
import '../Model/API,s Models/product_model.dart';

import '../Routes/routes_name.dart';

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
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('username', username);
    String url =
        'https://www.daaemsolutions.com/test/audit_api/login/'; // Replace with your API endpoint
    http
        .post(
      Uri.parse(url),
      body: formData,
    )
        .then((value) {
      if (value.statusCode == 200) {
        // Login successful
        print('Login successful! ${value.body}');

        String responseBody = value.body;
        String merchandiserId = extractValueFromBody(responseBody);
        print('Merchandiser ID: $merchandiserId');
        merchandiser_id = merchandiserId;

        getRetailerData(merchandiser_id: merchandiserId).then((value) {
          //ROUTE TO HOME
          Get.toNamed(RoutesName.homeScreen);
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
    final url =
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
