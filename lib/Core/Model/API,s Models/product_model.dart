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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['barcode'] = this.barcode;
    return data;
  }
}
