import 'dart:convert';
import 'dart:developer';

import 'package:daaem_reports/Core/Model/API,s%20Models/Retailer_model.dart';
import 'package:daaem_reports/Core/Model/API,s%20Models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClass with ChangeNotifier {
  // reatiler_model firstmodel = reatiler_model();
  List<reatiler_model> reatilerlist = [];
  List<branch_model> branchList = [];

  var Data = "";
  List<reatiler_model> firstlist = [];

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
        reatilerlist.add(reatiler_model.fromJson(responseData[i]));
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
        branchList.add(branch_model.fromJson(responseData[i]));
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
}
