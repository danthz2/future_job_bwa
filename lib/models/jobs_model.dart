class JobsModel {
  String? id;
  String? name;
  String? category;
  String? companyName;
  String? companyLogo;
  String? location;
  List<String>? about;
  List<String>? qualifications;
  List<String>? responsibilities;
  int? createdAt;
  int? updatedAt;

  JobsModel(
      {this.id,
      this.name,
      this.category,
      this.companyName,
      this.companyLogo,
      this.location,
      this.about,
      this.qualifications,
      this.responsibilities,
      this.createdAt,
      this.updatedAt});

  JobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    companyName = json['companyName'];
    companyLogo = json['companyLogo'];
    location = json['location'];
    about = json['about'].cast<String>();
    qualifications = json['qualifications'].cast<String>();
    responsibilities = json['responsibilities'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['companyName'] = this.companyName;
    data['companyLogo'] = this.companyLogo;
    data['location'] = this.location;
    data['about'] = this.about;
    data['qualifications'] = this.qualifications;
    data['responsibilities'] = this.responsibilities;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
