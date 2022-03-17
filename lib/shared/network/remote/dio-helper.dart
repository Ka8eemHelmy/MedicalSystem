import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';

//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: "http://api.instant-ss.com/api/v1/",
        receiveDataWhenStatusError: true,
        //Here we Put The Headers Needed in The API.
        headers: {
          'Content-Type': 'application/json',
          //'lang':'en'
        },
      ),
    );
  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
    );
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    bool files = false,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
      //'Content-Type': 'multipart/form-data',
      'accept': '*/*',
      //'Content-Type': 'multipart/form-data',
    };
    if (files) {
      FormData formData = FormData.fromMap(
        data,
      );
      return await dio.post(url, data: formData);
    } else {
      return await dio.post(url, data: data);
    }
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
    };
    if (files) {
      FormData formData = FormData.fromMap(
        data,
      );
      return await dio.put(
        url,
        data: formData,
      );
    } else {
      return await dio.put(
        url,
        data: data,
      );
    }
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
      'Content-Type': 'application/json',
    };
    return dio
        .delete(
      url,
    )
        .catchError(
      (error) {
        print("DIO ERROR $error");
      },
    );
  }
}
