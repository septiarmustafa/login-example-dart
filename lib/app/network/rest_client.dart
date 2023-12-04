import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'exception.dart';

class RestClient {
  Dio dio = Dio();
  // BaseApiService() : dio = Dio(options);
  Future<RestClient> init() async {
    try {
      // await GetStorage.init();
      // final box = GetStorage();
      // var token = box.read("token");
      // Map<String, dynamic> headers = {'Authorization': "Bearer $token"};
      var options = BaseOptions(
        connectTimeout: const Duration(seconds: 30000),
        // headers: headers,
        receiveTimeout: const Duration(seconds: 30000),
      );
      dio = Dio(options);
      initInterceptors();
      return this;
    } catch (e) {
      return this;
    }
  }

  void initInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('REQUEST[${options.method}] => PATH: ${options.path} '
            '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      }
      return handler.next(response);
    }, onError: (err, handler) {
      if (kDebugMode) {
        // ignore: avoid_print
        print('ERROR[${err.response?.statusCode}]');
      }
      return handler.next(err);
    }));
  }

  //get data
  getData(
      {String? url,
      Map<String, dynamic>? headers,
      Map<String, String>? payload}) async {
    await init();
    if (url == null) {
      return;
    }
    try {
      dio.options.headers.addAll(headers ?? {});
      var response = await dio.get(url);
      return _processResponse(response);
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
    } catch (e) {
      rethrow;
    }
  }

  //post data
  postData(
      {String? url, dynamic payload, Map<String, dynamic>? headers}) async {
    await init();
    if (url == null) {
      return;
    }

    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.post(
        url,
        data: payload ?? {},
      );

      return _processResponse(response);
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } on SocketException catch (_) {
      if (kDebugMode) {
        print('not connected');
      }
    } catch (e) {
      rethrow;
    }
  }

  //update data
  updateData(
      {String? url, dynamic payload, Map<String, dynamic>? headers}) async {
    await init();
    if (url == null) {
      return;
    }

    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.patch(
        url,
        data: payload ?? {},
      );

      return _processResponse(response);
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  //delete data
  deleteData(
      {String? url, dynamic payload, Map<String, dynamic>? headers}) async {
    await init();
    if (url == null) {
      return;
    }
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      var response = await dio.delete(
        url,
        data: payload ?? {},
      );

      return _processResponse(response);
      // ignore: deprecated_member_use
    } on DioError catch (dioError) {
      throw _dioException(dioError);
    } catch (e) {
      rethrow;
    }
  }

  _processResponse(response) {
    if (response == null) {
      // ignore: avoid_print
      return print("Something went wrong");
    }
    switch (response.statusCode) {
      case 200:
        var decodedJson = response.data;
        return decodedJson;
      case 201:
        var decodedJson = response.data;
        return decodedJson;
      case 400:
        var message = jsonDecode(response.toString())["message"];
        // showPopup("Error", message);
        throw ClientException(message: message, response: response.data);
      case 401:
        var message = jsonDecode(response.toString())["message"];
        if (message == 'Token Expired') {
          return ClientException(message: message, response: response.data);
        }
        // showPopup("Error", message);
        throw message;
      case 404:
        var message = jsonDecode(response.toString())["message"];
        // showPopup("Error", message);
        throw message;
      case 500:
        var message = jsonDecode(response.toString())["message"];
        if (message == 'Server Error') {
          return ClientException(message: message, response: response.data);
        }
        // showPopup("Error", "Server Error");
        throw ServerException(message: "Something went wrong");
      case 504:
        // showPopup("Error", "Server Down");
        throw ServerException(message: "Server went down");
      default:
        // showPopup("Error", message);
        throw HttpException(
            statusCode: response.statusCode, message: "Something went wrong");
    }
  }

  _dioException(dioErr) {
    log("Cek dio eror : $dioErr");
    // switch (dioErr.type) {
    //   case DioErrorType.response:
    //     throw _processResponse(dioErr.response);
    //   case DioErrorType.sendTimeout:
    //     throw "Something went wrong";
    //   case DioErrorType.receiveTimeout:
    //     throw "Something went wrong";
    //   default:
    //     throw "Something went wrong";}
  }
}
