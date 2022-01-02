import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_template/results/dataResultList.dart';

import '../../../Results/dataResult.dart';
import '../../../core/base/enum/preferences_keys.dart';
import '../../../core/base/enum/request_type.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/service/shared_preferences/get_error_message.dart';
import '../../../core/service/shared_preferences/shared_preferences_service.dart';
import '../../../serializeable.dart';

import 'package:http/http.dart' as http;

const JsonEncoder encoder = JsonEncoder.withIndent('  ');

class ApiService {
  http.Request headers(RequestType type, String addtionalUrl) {
    var headers = {'Content-Type': 'application/json'};
    var authorization = {'Authorization': 'Bearer ' + SharedPreferenceService.instance.getStringValue(PreferencesKeys.TOKEN)!};
    var request = http.Request(
      describeEnum(type),
      Uri.parse((ApplicationConstants.APP_IS_DEVELOPER_MODE ? ApplicationConstants.APP_API_DEV_URL : ApplicationConstants.APP_API_PRO_URL) + "/" + addtionalUrl),
    );
    request.headers.addAll(headers);
    request.headers.addAll(authorization);

    return request;
  }

  Future<DataResult<R>> post<T, R extends ISerializeable>(T data, String addtionalUrl) async {
    var request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    try {
      http.StreamedResponse response = await request.send();
      String resultJson = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = jsonDecode(resultJson);
        DataResult<R> result = DataResult<R>.fromJson(dataMap);
        return result;
      } else if (response.statusCode == 400) {
        //bad request
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResult.v7(data: null, success: false, message: message);
      } else {
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResult.v7(success: false, message: message);
      }
    } catch (e) {
      print(e);

      return DataResult.v7(data: null, success: false, message: e.toString());
    }
  }

  Future<DataResultList<R>> postList<T, R extends ISerializeable>(T data, String addtionalUrl) async {
    var request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    try {
      http.StreamedResponse response = await request.send();
      String resultJson = await response.stream.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = jsonDecode(resultJson);
        DataResultList<R> result = DataResultList<R>.fromJson(dataMap);
        return result;
      } else if (response.statusCode == 400) {
        //bad request
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResultList.v7(data: null, success: false, message: message);
      } else {
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResultList.v7(data: null, success: false, message: message);
      }
    } catch (e) {
      print(e);

      return DataResultList.v7(data: null, success: false, message: e.toString());
    }
  }

  Type typeOf<T>() => T;

  Future<DataResult<R>> create<T, R extends ISerializeable>(T data, [String addtionalUrl = "add"]) async {
    var request;
    request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    try {
      http.StreamedResponse response = await request.send();
      String resultJson = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = jsonDecode(resultJson);
        DataResult<R> result = DataResult<R>.fromJson(dataMap);
        return result;
      } else if (response.statusCode == 400) {
        //bad request
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResult.v7(data: null, success: false, message: message);
      } else {
        String message = await GetErrorMessage.getError(resultJson, response.statusCode);
        return DataResult.v7(success: false, message: message);
      }
    } catch (e) {
      print(e);

      return DataResult.v7(data: null, success: false, message: e.toString());
    }
  }

  Future<DataResultList<R>> createRange<T extends ISerializeable, R extends ISerializeable>(List<T> data, [String addtionalUrl = "addrange"]) async {
    var request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResultList<R> result = DataResultList<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResultList.v7(success: false, message: message);
    }
  }

  Future<DataResult<R>> update<T extends ISerializeable, R extends ISerializeable>(T data, [String addtionalUrl = "update"]) async {
    var request = headers(RequestType.PUT, addtionalUrl);
    request.body = encoder.convert(data);

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResult<R> result = DataResult<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResult.v7(success: false, message: message);
    }
  }

  Future<DataResultList<R>> updateRange<T extends ISerializeable, R extends ISerializeable>(List<T> data, [String addtionalUrl = "updaterange"]) async {
    var request = headers(RequestType.PUT, addtionalUrl);
    request.body = encoder.convert(data);

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResultList<R> result = DataResultList<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResultList.v7(success: false, message: message);
    }
  }

  Future<DataResult<R>> deleteByModel<T extends ISerializeable, R extends ISerializeable>(T data, [String addtionalUrl = "delete"]) async {
    var request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResult<R> result = DataResult<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResult.v7(success: false, message: message);
    }
  }

  Future<DataResultList<R>> deleteByModelList<T extends ISerializeable, R extends ISerializeable>(List<T> data, [String addtionalUrl = "delete"]) async {
    var request = headers(RequestType.POST, addtionalUrl);
    request.body = encoder.convert(data);

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResultList<R> result = DataResultList<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResultList.v7(success: false, message: message);
    }
  }

  Future<DataResult<R>> deleteById<T extends ISerializeable, R extends ISerializeable>(int id, [String addtionalUrl = "deletebyid"]) async {
    var request = headers(RequestType.DELETE, addtionalUrl + "?entityId=" + id.toString());

    http.StreamedResponse response = await request.send();
    String resultJson = await response.stream.bytesToString();
    Map<String, dynamic> dataMap = jsonDecode(resultJson);

    if (response.statusCode == 200) {
      DataResult<R> result = DataResult<R>.fromJson(dataMap);
      return result;
    } else {
      String message = await GetErrorMessage.getError(resultJson, response.statusCode);
      return DataResult.v7(success: false, message: message);
    }
  }
}
