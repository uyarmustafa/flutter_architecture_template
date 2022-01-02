
import 'package:flutter_architecture_template/results/result.dart';
import 'package:json_annotation/json_annotation.dart';

import '../serializeable.dart';

@JsonSerializable()
class DataResultList<T extends ISerializeable> extends Result {
  List<T>? data;
  int? totalCount;
  DataResultList({this.data, bool? success}) : super(success: success);
  DataResultList.v2({this.data, bool? success, String? code})
      : super.constWCode(success: success, code: code);
  DataResultList.v3({this.data, bool? success, String? code, String? message})
      : super.constWCodeAndMessage(
            success: success, code: code, message: message);
  DataResultList.v4({this.data, bool? success, this.totalCount})
      : super(success: success);
  DataResultList.v5({this.data, bool? success, String? code, this.totalCount})
      : super.constWCode(success: success, code: code);
  DataResultList.v6(
      {this.data,
      bool? success,
      String? code,
      String? message,
      this.totalCount})
      : super.constWCodeAndMessage(
            success: success, code: code, message: message);
  DataResultList.v7({this.data, bool? success, String? message})
      : super.constWMessage(success: success, message: message);

  DataResultList.fromJson(Map<String, dynamic> json) {
    // var gg = json['data'];
    // var list = json['data'] as List<Map<String, dynamic>>;
    // data = List<T>.from(list.map((model) => ISerializeable.create(T, model)));
    // data = ISerializeable.create(T, json['data']);
    data = <T>[];
    json['data'].forEach((v) {
      data!.add(ISerializeable.create(T, v));
    });
    totalCount = json['totalCount'];
    success = json['success'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'totalCount': totalCount,
        'success': success,
        'code': code,
        'message': message,
      };
}
