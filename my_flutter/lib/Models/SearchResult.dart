class SearchList {
  int total;
  int num;
  List<ResultList> list;

  SearchList({this.total, this.num, this.list});

  SearchList.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    num = json['num'];
    if (json['list'] != null) {
      list = new List<ResultList>();
      json['list'].forEach((v) {
        list.add(new ResultList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['num'] = this.num;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResultList {
  int id;
  int classid;
  String name;
  String peoplenum;
  String preparetime;
  String cookingtime;
  String content;
  String pic;
  String tag;
  List<Material> material;
  List<Process> process;

  ResultList(
      {this.id,
      this.classid,
      this.name,
      this.peoplenum,
      this.preparetime,
      this.cookingtime,
      this.content,
      this.pic,
      this.tag,
      this.material,
      this.process});

  ResultList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classid = json['classid'];
    name = json['name'];
    peoplenum = json['peoplenum'];
    preparetime = json['preparetime'];
    cookingtime = json['cookingtime'];
    content = json['content'];
    pic = json['pic'];
    tag = json['tag'];
    if (json['material'] != null) {
      material = new List<Material>();
      json['material'].forEach((v) {
        material.add(new Material.fromJson(v));
      });
    }
    if (json['process'] != null) {
      process = new List<Process>();
      json['process'].forEach((v) {
        process.add(new Process.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classid'] = this.classid;
    data['name'] = this.name;
    data['peoplenum'] = this.peoplenum;
    data['preparetime'] = this.preparetime;
    data['cookingtime'] = this.cookingtime;
    data['content'] = this.content;
    data['pic'] = this.pic;
    data['tag'] = this.tag;
    if (this.material != null) {
      data['material'] = this.material.map((v) => v.toJson()).toList();
    }
    if (this.process != null) {
      data['process'] = this.process.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Material {
  String mname;
  int type;
  String amount;

  Material({this.mname, this.type, this.amount});

  Material.fromJson(Map<String, dynamic> json) {
    mname = json['mname'];
    type = json['type'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mname'] = this.mname;
    data['type'] = this.type;
    data['amount'] = this.amount;
    return data;
  }
}

class Process {
  String pcontent;
  String pic;

  Process({this.pcontent, this.pic});

  Process.fromJson(Map<String, dynamic> json) {
    pcontent = json['pcontent'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pcontent'] = this.pcontent;
    data['pic'] = this.pic;
    return data;
  }
}
