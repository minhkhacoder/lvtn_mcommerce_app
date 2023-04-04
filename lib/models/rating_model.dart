class Rating {
  bool? success;
  List<DataRating>? data;

  Rating({this.success, this.data});

  Rating.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataRating>[];
      json['data'].forEach((v) {
        data!.add(new DataRating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataRating {
  String? id;
  String? desc;
  int? point;
  String? createdAt;
  String? customer;

  DataRating({this.id, this.desc, this.point, this.createdAt, this.customer});

  DataRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desc = json['desc'];
    point = json['point'];
    createdAt = json['createdAt'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desc'] = this.desc;
    data['point'] = this.point;
    data['createdAt'] = this.createdAt;
    data['customer'] = this.customer;
    return data;
  }
}
