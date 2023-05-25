import 'package:hive/hive.dart';
part "model.g.dart";

@HiveType(typeId: 0)
class ModelHive extends HiveObject {
  @HiveField(0)
  String? retailerId;
  @HiveField(1)
  String? branchId;
  @HiveField(2)
  String? custmoreId;
  @HiveField(3)
  String? categoryId;
  @HiveField(4)
  String? productId;

  ModelHive({
    this.retailerId,
    this.branchId,
    this.custmoreId,
    this.categoryId,
    this.productId,
  });
}
