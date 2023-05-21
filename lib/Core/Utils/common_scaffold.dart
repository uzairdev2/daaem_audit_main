// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appbar.dart';

class CommonScaffold extends StatelessWidget {
  CommonScaffold({required this.body, super.key});
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: CustomAppBar()),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(child: body),
        ));
  }
}
