class UserModel {
  String? name;
  String? email;
  String? uid;
  String? phonenumber;
  UserModel(
      {this.phonenumber,
      required this.name,
      required this.email,
      required this.uid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        uid: json['uid'],
        phonenumber: json['phonenumber']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'phonenumber': phonenumber
    };
  }
}
