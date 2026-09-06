import 'dart:convert';

class ParamsModel {
  int? limit;
  dynamic after;

  ParamsModel({this.limit, this.after});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (limit != null) {
      result.addAll({'limit': limit});
    }
    if (after != null) {
      result.addAll({'after': after});
    }

    return result;
  }

  String toJson() => json.encode(toMap());
}
