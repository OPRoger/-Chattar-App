class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.profileImage, 
      this.phoneNumber, 
      this.about, 
      this.createdAt, 
      this.lastOnlineStatus, 
      this.status,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    about = json['About'];
    createdAt = json['CreatedAt'];
    lastOnlineStatus = json['LastOnlineStatus'];
    status = json['Status'];
  }
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;
UserModel copyWith({  String? id,
  String? name,
  String? email,
  String? profileImage,
  String? phoneNumber,
  String? about,
  String? createdAt,
  String? lastOnlineStatus,
  String? status,
}) => UserModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  profileImage: profileImage ?? this.profileImage,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  about: about ?? this.about,
  createdAt: createdAt ?? this.createdAt,
  lastOnlineStatus: lastOnlineStatus ?? this.lastOnlineStatus,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['profileImage'] = profileImage;
    map['phoneNumber'] = phoneNumber;
    map['About'] = about;
    map['CreatedAt'] = createdAt;
    map['LastOnlineStatus'] = lastOnlineStatus;
    map['Status'] = status;
    return map;
  }

}