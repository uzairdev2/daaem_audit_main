class ProductModel {
  String? productId;
  String? productName;
  String? barcode;

  ProductModel({this.productId, this.productName, this.barcode});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['barcode'] = barcode;
    return data;
  }
}
