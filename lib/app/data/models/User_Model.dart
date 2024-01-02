// ignore_for_file: file_names

class UserModel {
  String? name;
  String? email;
  String? userid;

  UserModel({
    required this.email,
    required this.userid,
    required this.name,
  });

  UserModel.fromJcon({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    userid = data['userid'];
  }

  Map<String, dynamic> toJcon() {
    return {
      'name': name,
      'email': email,
      'userid': userid,
    };
  }
}
