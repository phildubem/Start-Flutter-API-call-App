class StringName {
  String name;
  String username;
  String email;
  int phone;

  StringName(this.name, this.username, this.email, this.phone);

  StringName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }
}