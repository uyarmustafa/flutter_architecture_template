import 'dart:convert';
import '../../../Results/errorDataResult.dart';
import '../../../core/functions/get_message_with_code.dart';

class GetErrorMessage {
  static Future<String> getError(String json, int statusCode) async {
    if (statusCode == 503) {
      return "Service Unavailable";
    }

    if (statusCode == 401) {
      //SharedPreferenceService.instance.clearToken();
      //RefreshToken
      return "Geçersiz Token";
    }

    //bad request
    if (statusCode == 400 && json.isEmpty) {
      return "Hatalı istek";
    }

    Map<String, dynamic> dataMap = jsonDecode(json);
    String message = GetMessageWithCode().getMessage(ErrorDataResult.fromJson(dataMap).code!) + "\n" + ErrorDataResult.fromJson(dataMap).message!;

    return message;
  }
}
