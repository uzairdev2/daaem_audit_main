class CustomerModel {
  String? customerId;
  String? customerName;

  CustomerModel({this.customerId, this.customerName});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    return data;
  }
}
