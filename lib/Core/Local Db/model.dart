// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
part "model.g.dart";

@HiveType(typeId: 0)
class ModelHive extends HiveObject {
  @HiveField(0)
  String table_name;
  @HiveField(1)
  String barcode;
  @HiveField(2)
  String quamtitiy;

  ModelHive({
    required this.barcode,
    required this.table_name,
    required this.quamtitiy,
  });
}
