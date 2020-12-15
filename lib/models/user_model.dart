class User {
  final String name;
  final String phone;

  User({this.name, this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = Map<String, dynamic>();
    user["name"] = name;
    user["phone"] = this.phone;
    return user;
  }
}
