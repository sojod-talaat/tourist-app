class usermodel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  usermodel(
      {this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone});
  usermodel.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    name = map['name'];
    id = map['id'];
    phone = map['phone'];
  }
  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name, 'id': id, 'phone': phone};
  }
}
