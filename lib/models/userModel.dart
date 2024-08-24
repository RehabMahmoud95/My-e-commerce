class UserModel {
  String? userName;
  String? address;
  String? phone;

  UserModel(this.userName, this.phone, this.address);

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    address = json['address'];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = 
     Map<String, dynamic>();
    data['userName'] = this.userName;
    data['address'] = this.address;
    data['phone'] = this.phone;

    return data;
  }
}
