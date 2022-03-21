class UserData {
  String? id, name, email, image;

  UserData({this.id, this.name, this.email, this.image});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'image': image};
  }
}
