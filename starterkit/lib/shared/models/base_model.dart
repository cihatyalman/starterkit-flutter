import 'dart:convert';

import 'package:intl/intl.dart';

abstract class BaseModel {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  BaseModel({this.id, this.createdAt, this.updatedAt});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.toISOStringUtc});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt!.toISOStringUtc});
    }

    return result;
  }

  // factory BaseModel.fromMap(Map<String, dynamic> map) {
  //   return BaseModel(
  //     id: map['id'],
  //     createdAt: (map['createdAt'] as String?)?.toDateLocal,
  //     updatedAt: (map['updatedAt'] as String?)?.toDateLocal,
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory BaseModel.fromJson(String source) =>
  //     BaseModel.fromMap(json.decode(source));
}

extension DateTimeExtension on DateTime {
  String get toISOStringUtc =>
      '${DateFormat("yyyy-MM-ddTHH:mm:ss").format(toUtc())}Z';
}

extension StringExtension on String {
  DateTime? get toDateLocal => DateTime.tryParse(this)?.toLocal();
}
