class UserModel {
  String? userName;
  String? userAvatar;
  String? dob;

  UserModel({this.userName, this.userAvatar, this.dob});

  // UserModel.fromJson(Map<String, dynamic> json) {
  //   userName = json['userName'];
  //   userAvatar = json['userAvatar'];
  //   dob = json['dob'];
  // }
  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['userAvatar'] != null) userAvatar = json['userAvatar'];
    if (json['userName'] != null) userName = json['userName'];
    if (json['dob'] != null) dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['userAvatar'] = userAvatar;
    data['dob'] = dob;
    return data;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (userAvatar != null) data['userAvatar'] = userAvatar;
  //   if (userName != null) data['userName'] = userName;
  //   if (dob != null) data['dob'] = dob;
  //   return data;
  // }
}
