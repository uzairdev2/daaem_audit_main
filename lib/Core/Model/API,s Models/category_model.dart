import 'package:daaem_reports/Core/Model/API,s%20Models/product_model.dart';

class CategoryModel {
  String? categoryId;
  String? categoryName;
  List<ProductModel> productModel;

  CategoryModel({this.categoryId, this.categoryName,required this.productModel});

  CategoryModel.fromJson(Map<String, dynamic> json):
        categoryId = json['category_id'],
        categoryName = json['category_name'],
        productModel = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}
