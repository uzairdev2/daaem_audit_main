// ignore_for_file: file_names

import 'dart:io';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';

class SecondaryModel {
  @HiveField(0)
  late String productId;
  @HiveField(1)
  late String categoryId;
  @HiveField(2)
  late Rx<File?> imagePath;

  SecondaryModel({
    required this.productId,
    required this.categoryId,
    required this.imagePath,
  });
}
