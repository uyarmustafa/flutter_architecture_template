class Result {
  bool? success;
  String? message;
  String? code;

  Result({this.success});
  Result.constWCode({this.success, this.code});
  Result.constWCodeAndMessage({this.success, this.code, this.message});
  Result.constWMessage({this.success, this.message});
}