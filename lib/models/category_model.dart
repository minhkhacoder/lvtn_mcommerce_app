class Category {
  String? catId;
  String? catName;
  String? catParent;

  Category({this.catId, this.catName, this.catParent});

  Category.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catParent = json['cat_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_parent'] = this.catParent;
    return data;
  }
}
