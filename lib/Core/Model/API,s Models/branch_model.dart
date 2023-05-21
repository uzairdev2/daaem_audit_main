class branch_model {
  String? branchId;
  String? branchName;

  branch_model({this.branchId, this.branchName});

  branch_model.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    return data;
  }
}
