class CategoryResult {
  int status;
  String msg;
  List<BigCategoryItem> result;

  CategoryResult({this.status, this.msg, this.result});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = new List<BigCategoryItem>();
      json['result'].forEach((v) {
        BigCategoryItem bigCategoryItem = new BigCategoryItem.fromJson(v);
        switch (bigCategoryItem.classid) {
          case 1:
            bigCategoryItem.imageName = "effect";
            break;
          case 113:
            bigCategoryItem.imageName = "crowd";
            break;
          case 144:
            bigCategoryItem.imageName = "disease";
            break;
          case 213:
            bigCategoryItem.imageName = "physical";
            break;
          case 223:
            bigCategoryItem.imageName = "cuisine";
            break;
          case 269:
            bigCategoryItem.imageName = "snacks";
            break;
          case 301:
            bigCategoryItem.imageName = "foodlist";
            break;
          case 390:
            bigCategoryItem.imageName = "taste";
            break;
          case 453:
            bigCategoryItem.imageName = "process";
            break;
          case 524:
            bigCategoryItem.imageName = "Kitchen";
            break;
          case 561:
            bigCategoryItem.imageName = "sceens";
            break;
          default:
        }
        result.add(bigCategoryItem);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BigCategoryItem {
  int classid;
  String name;
  int parentid;
  String imageName;
  List<SmallCategoryItem> list;

  BigCategoryItem({this.classid, this.name, this.parentid, this.list});

  BigCategoryItem.fromJson(Map<String, dynamic> json) {
    classid = json['classid'];
    name = json['name'];
    parentid = json['parentid'];
    if (json['list'] != null) {
      list = new List<SmallCategoryItem>();
      json['list'].forEach((v) {
        list.add(new SmallCategoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classid'] = this.classid;
    data['name'] = this.name;
    data['parentid'] = this.parentid;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SmallCategoryItem {
  int classid;
  String name;
  int parentid;

  SmallCategoryItem({this.classid, this.name, this.parentid});

  SmallCategoryItem.fromJson(Map<String, dynamic> json) {
    classid = json['classid'];
    name = json['name'];
    parentid = json['parentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classid'] = this.classid;
    data['name'] = this.name;
    data['parentid'] = this.parentid;
    return data;
  }
}
