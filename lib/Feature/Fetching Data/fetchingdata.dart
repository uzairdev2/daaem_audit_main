import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import '../../Core/Local DB/model.dart';
import '../../Core/Local DB/openBox.dart';
import '../../Core/Utils/customText.dart';

class HiveData extends StatelessWidget {
  const HiveData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: ValueListenableBuilder<Box<ModelHive>>(
                valueListenable: Boxes.getData().listenable(),
                builder: (context, boxes, _) {
                  var data = boxes.values.toList().cast<ModelHive>();

                  return ListView.builder(
                      itemCount: boxes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left: 35.w, right: 35.w, top: 20.h),
                            child: Column(
                              children: [
                                CustomText(
                                  color: black,
                                  name:
                                      "retailerId${data[index].retailerId.toString()}",
                                ),
                                10.h.ph,
                                CustomText(
                                  color: black,
                                  name:
                                      "branchId${data[index].branchId.toString()}",
                                ),
                                10.h.ph,
                                CustomText(
                                  color: black,
                                  name:
                                      "custmoreId${data[index].custmoreId.toString()}",
                                ),
                                10.h.ph,
                                CustomText(
                                  color: black,
                                  name:
                                      "categoryId${data[index].categoryId.toString()}",
                                ),
                                10.h.ph,
                              ],
                            ));
                      });
                })),
      ],
    ));
  }
}
