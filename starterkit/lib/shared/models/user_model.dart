import 'dart:convert';

import 'base_model.dart';

class UserModel extends BaseModel {
  int role;
  String? username;
  String? fullname;
  String? profileImageUrl;
  DateTime? lastLoginDate;

  UserModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    this.role = 1,
    this.username,
    this.fullname,
    this.profileImageUrl,
    this.lastLoginDate,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = super.toMap();

    result.addAll({'role': role});
    if (username != null) {
      result.addAll({'username': username});
    }
    if (fullname != null) {
      result.addAll({'fullname': fullname});
    }
    if (profileImageUrl != null) {
      result.addAll({'profileImageUrl': profileImageUrl});
    }
    if (lastLoginDate != null) {
      result.addAll({'lastLoginDate': lastLoginDate?.toISOStringUtc});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      createdAt: (map['createdAt'] as String?)?.toDateLocal,
      updatedAt: (map['updatedAt'] as String?)?.toDateLocal,
      role: map['role']?.toInt() ?? 1,
      username: map['username'],
      fullname: map['fullname'],
      profileImageUrl: map['profileImageUrl'],
      lastLoginDate: (map['lastLoginDate'] as String?)?.toDateLocal,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
