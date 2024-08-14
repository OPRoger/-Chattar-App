class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.profileImage, 
      this.email, 
      this.phoneNumber,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profileImage'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }
  String? id;
  String? name;
  String? profileImage;
  String? email;
  String? phoneNumber;
UserModel copyWith({  String? id,
  String? name,
  String? profileImage,
  String? email,
  String? phoneNumber,
}) => UserModel(  id: id ?? this.id,
  name: name ?? this.name,
  profileImage: profileImage ?? this.profileImage,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['profileImage'] = profileImage;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}