class UserModel{
  String name;
  String email;
  bool status;

  UserModel({required this.name,required this.email, required this.status});

  factory UserModel.getJson(Map json){
    return UserModel(name: json['data']['name'], email: json['data']['email'], status: json['status']);
  }
}