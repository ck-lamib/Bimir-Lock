List<PasswordTable> passwordfromJson(List<dynamic> passwordsJson) =>
    passwordsJson.map((passwordJson) => PasswordTable.fromJson(passwordJson)).toList();

class PasswordTable {
  int? id;
  String? title;
  String? userName;
  String? email;
  String? password;

  PasswordTable({this.id, this.title, this.userName, this.email, this.password});

  PasswordTable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (userName != null) data['userName'] = userName;
    if (email != null) data['email'] = email;
    if (password != null) data['password'] = password;
    return data;
  }
}
