class Category {
  bool? success;
  List<Data>? data;

  Category({this.success, this.data});

  Category.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? id;
  String? label;
  String? parent;
  List<Childrens>? childrens;

  Data({this.id, this.label, this.parent, this.childrens});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    parent = json['parent'];
    if (json['childrens'] != null) {
      childrens = <Childrens>[];
      json['childrens'].forEach((v) {
        childrens!.add(new Childrens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['parent'] = this.parent;
    if (this.childrens != null) {
      data['childrens'] = this.childrens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childrens {
  String? id;
  String? label;
  String? parent;

  Childrens({this.id, this.label, this.parent});

  Childrens.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['parent'] = this.parent;
    return data;
  }
}
