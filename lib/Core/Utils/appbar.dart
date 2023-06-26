// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:daaem_reports/Core/Utils/customButton.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../API,s Intergartion/API,s.dart';
import '../Constant/Colors/colors.dart';
import '../Constant/Images/images.dart';
import '../Controller/controller_detail.dart';
import 'custom_text.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var Data = "";
  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiClass>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
        ),
        child: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            menu,
            height: 17.h,
            width: 35.84.w,
          ),
        ),
      ),
      title: CustomText(
        name: "Daaem Reports",
        size: 18.sp,
        weightFont: FontWeight.w700,
      ),
      centerTitle: true,
      actions: [
        Obx(
          () => CustomButton(
            name: "Send ",
            size: 14.sp,
            width: 65.w,
            height: 30.h,
            color:
                storingIDController.isDatabaseEmpty.value == false ? grey : red,
            ontap: () async {
              await printIdController.planogramDbHive();
              await printIdController.cleaningDbHive();
              await printIdController.neighborsDBHive();
              await printIdController.product_Details();

              print(
                  "here is  outer data ==> ${printIdController.productDetails}");

              List convertedList = printIdController.productDetails.values
                  .map((innerMap) => innerMap.cast<String, dynamic>())
                  .toList();

              convertedList.add(printIdController.planogramMap);
              convertedList.add(printIdController.cleaningMap);
              convertedList.add(printIdController.neighborsMap);

              print('Converted full  List: $convertedList');
              print('Converted List length: ${convertedList.length}');

              for (int i = 0; i < convertedList.length; i++) {
                await apiData.syncData(
                  MapData: convertedList[i],
                );
              }
            },
          ),
        ),
        10.h.pw
      ],
    );
  }

  // planogramFtnGetingIDs() async {
  //   final boxname = await Hive.openBox("planogramData");
  //   storingIDController.retailerid.value = boxname.get("retailerid");
  //   storingIDController.branchid.value = boxname.get("branchid");
  //   storingIDController.custmoreid.value = boxname.get("custmoreid");
  //   storingIDController.categoryid.value = boxname.get("categoryid");
  //   print(storingIDController.branchid.value);
  //   print(storingIDController.categoryid.value);
  //   boxname.close();
  // }

  // sendData() async {
  //   final planogram = await Hive.openBox("planogramData");//
  //   final cleaning = await Hive.openBox("cleaningData");//
  //   final Competitor = await Hive.openBox("CompetitorPromotionData");//
  //   final newItem = await Hive.openBox("newItemData");//
  //   final priceLabel = await Hive.openBox("priceLabelData");//
  //
  //   final body = {'merchandiser_id': planogram};
  //   String url =
  //       'https://www.daaemsolutions.com/test/audit_api/retailer/'; // Replace with your API endpoint
  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: body,
  //   );
  //
  //   if (response.statusCode == 200) {
  //     Data = response.body;
  //
  //     final List<dynamic> responseData = json.decode(response.body);
  //
  //
  //     // log("here is data ${firstmodel.retailerName!.length}");
  //   } else {
  //     // API request failed
  //     print('Request failed with status: ${response.statusCode}');
  //   }
  //
  //
  // }
}
