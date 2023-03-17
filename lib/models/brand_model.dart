class Brand {
  String? braId;
  String? braName;

  Brand({this.braId, this.braName});

  Brand.fromJson(Map<String, dynamic> json) {
    braId = json['bra_id'];
    braName = json['bra_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bra_id'] = this.braId;
    data['bra_name'] = this.braName;
    return data;
  }
}
