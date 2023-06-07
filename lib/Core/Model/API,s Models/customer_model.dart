class CustomerModel {
  String? customerId;
  String? customerName;

  CustomerModel({this.customerId, this.customerName});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['customer_name'] = customerName;
    return data;
  }
}
