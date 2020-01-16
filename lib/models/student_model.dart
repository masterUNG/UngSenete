class StudentModel {
  String id;
  String name;
  int score;

  StudentModel({this.id, this.name, this.score});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }
}

