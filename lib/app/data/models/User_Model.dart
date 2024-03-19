// ignore_for_file: file_names

class UserModel {
  String? name;
  String? email;
  String? userid;
  int? phoneNumber;
  String? imageUrl;

  UserModel({
    required this.email,
    required this.userid,
    required this.name,
    required this.imageUrl,
    required this.phoneNumber,
  });

  UserModel.fromJcon({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    userid = data['userid'];
    imageUrl = data['imageUrl'];
    phoneNumber = data['phoneNumber'];
  }

  Map<String, dynamic> toJcon() {
    return {
      'name': name,
      'email': email,
      'userid': userid,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
    };
  }
}
