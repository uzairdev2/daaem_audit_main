class RetailerModel {
  String? retailerId;
  String? retailerName;

  RetailerModel({this.retailerId, this.retailerName});

  RetailerModel.fromJson(Map<String, dynamic> json) {
    retailerId = json['retailer_id'];
    retailerName = json['retailer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['retailer_id'] = retailerId;
    data['retailer_name'] = retailerName;
    return data;
  }
}
