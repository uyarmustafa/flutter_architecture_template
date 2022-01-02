import 'package:json_annotation/json_annotation.dart';

import '../serializeable.dart';
import 'dataResult.dart';

@JsonSerializable()
class ErrorDataResult<T extends ISerializeable> extends DataResult<T> {
  String? errorDetail;
  String? errorCode;
  int? totalCount;
  @override
  bool? success;
  @override
  String? message;
  @override
  String? code;
  @override
  T? data;

  ErrorDataResult({this.errorCode, this.message})
      : super.v7(data: null, success: false, message: message);
  ErrorDataResult.v2({this.message, this.errorCode, this.errorDetail})
      : super.v3(data: null, success: false, message: message);

  ErrorDataResult.fromJson(Map<String, dynamic> json) {
    data = null;
    totalCount = json['totalCount'];
    success = json['success'];
    code = json['code'];
    message = json['message'];
    errorDetail = json['errorDetail'];
    errorCode = json["errorCode"];
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'totalCount': totalCount,
        'success': success,
        'code': code,
        'message': message,
        'errorDetail': errorDetail,
        'errorCode': errorCode
      };
}
