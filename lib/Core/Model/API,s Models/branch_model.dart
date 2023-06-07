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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_id'] = branchId;
    data['branch_name'] = branchName;
    data['coordinates'] = coordinates;
    return data;
  }
}
