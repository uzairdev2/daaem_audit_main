class BranchModel {
  String? branchId;
  String? branchName;
  String? coordinates;

  BranchModel({this.branchId, this.branchName, this.coordinates});

  BranchModel.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    coordinates = json['coordinates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
