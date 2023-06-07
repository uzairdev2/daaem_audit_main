// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:daaem_reports/Core/Model/API,s%20Models/retailer_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/branch_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/API,s Models/category_model.dart';
import '../Model/API,s Models/customer_model.dart';
import '../Model/API,s Models/product_model.dart';

class ApiClass with ChangeNotifier {
  // reatiler_model firstmodel = reatiler_model();
  List<RetailerModel> reatilerlist = [];
  List<BranchModel> branchList = [];
  List<CustomerModel> customerList = [];
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<ModelScan> scanProduct = [];

  var Data = "";
  List<RetailerModel> firstlist = [];

  againsearch() {
    branchList = [];
    print("here is branch list ${branchList.length}");
    notifyListeners();
  }

  Future<void> getRetailerData() async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/retailer/?retailer_id=1'); // Replace with your API endpoint
    final response = await http.get(url);

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

  Future<void> getBranchData({required String retailerid}) async {
    final url = Uri.parse(
        'https://www.daaemsolutions.com/test/audit_api/branch/?retailer_id=$retailerid'); // Replace with your API endpoint
    final response = await http.get(url);

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
