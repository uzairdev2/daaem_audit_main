class ModelScan {
  String? brandId;
  String? subBrandId;
  String? productId;
  String? brandName;
  String? brandNameArabic;
  String? productName;
  String? productNameArabic;
  String? code;

  ModelScan(
      {this.brandId,
      this.subBrandId,
      this.productId,
      this.brandName,
      this.brandNameArabic,
      this.productName,
      this.productNameArabic,
      this.code});

  ModelScan.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    subBrandId = json['sub_brand_id'];
    productId = json['product_id'];
    brandName = json['brand_name'];
    brandNameArabic = json['brand_name_arabic'];
    productName = json['product_name'];
    productNameArabic = json['product_name_arabic'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['sub_brand_id'] = subBrandId;
    data['product_id'] = productId;
    data['brand_name'] = brandName;
    data['brand_name_arabic'] = brandNameArabic;
    data['product_name'] = productName;
    data['product_name_arabic'] = productNameArabic;
    data['code'] = code;
    return data;
  }
}
