import 'package:hive/hive.dart';
part "model.g.dart";

@HiveType(typeId: 0)
class ModelHive extends HiveObject {
  @HiveField(0)
  String barcode;
  @HiveField(1)
  String quamtitiy;

  ModelHive({
    required this.barcode,
    required this.quamtitiy,
  });
}
