import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:http/http.dart' as http;
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import '../storage/shared/shared_pref.dart';
import 'api_url.dart';
import 'package:path/path.dart';

//All Api methods with configuration to send http request
class ApiMethods {
  late Map<String, String> headers;
  final bool? isSecondBaseUrl;

  ApiMethods({Map<String, String>? header, this.isSecondBaseUrl}) {
    if (header == null) {
      headers = {'Content-Type': 'application/json'};
      // headers = {
      //   "Content-type": "application/json",
      //   "Accept": "application/json",
      //   "X-Parse-Application-Id": "soa",
      //   "X-Parse-REST-API-Key": "soa12345",
      //   "lang": AppSharedPreferences.getLanguage()
      // };
      if (AppSharedPreferences.getToken().isNotEmpty) {
        print(AppSharedPreferences.getToken());
        print('tokeeeeeeeeeeeeeeeeeeeeeeen');
        headers['Authorization'] = 'Bearer ${AppSharedPreferences.getToken()}';
      }
    } else {
      headers = header;
    }
  }

  //Filter Map From Incorrect Or Empty Values Function
  //with deafult value for each data type
  Map<String, dynamic> filterRequest(Map<String, dynamic> inputMap) {
    final filteredMap = inputMap
      ..removeWhere((key, value) =>
          value == null ||
          value == DateTime(0) ||
          value == '' ||
          value == -1 ||
          value == {} ||
          value == '{}' ||
          value is Map && value.isEmpty ||
          value == "0000-01-01" ||
          value == [] ||
          value == "0000-01-0");
    //Looping To Check Also The Objeccts Inside The Request
    filteredMap.forEach(
      (key, value) {
        if (value is Map<String, dynamic>) {
          filterRequest(value);
          filteredMap[key] = filterRequest(value);
        }
      },
    );
    return filteredMap;
  }

  //Using this function for all get requests
  //When the parameter does not needed set as empty value
  Future<http.Response> get(
      {required String url,
      Map<String, dynamic>? path,
      Map<String, dynamic>? query}) async {
    if (query != null) {
      query = filterRequest(query);
    }
    if (path != null) {
      path = filterRequest(path);
    }
    if (path != null && query != null && query.isNotEmpty && path.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getPath(path)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else if (query != null && query.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else if (path != null && path.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getPath(path)
              .getLink(),
          headers: headers);
    } else {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          headers: headers);
    }
  }

  //Using this function for all post requests
  //When the parameter does not needed set as empty value
  Future<http.Response> post(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    if (query != null) {
      query = filterRequest(query);
    }

    if (body != null) {
      body = filterRequest(body);
    }
    // ignore: unnecessary_null_comparison
    if (body != null && query != null && query.isNotEmpty) {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          body: jsonEncode(body),
          headers: headers);
    } else if (query != null && query.isNotEmpty) {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          body: jsonEncode(body),
          headers: headers);
    }
  }

  //Using this function for all pu requests
  //When the parameter does not needed set as empty value
  Future<http.Response> put(
      {required String url, body, required Map<String, dynamic> query}) async {
    query = filterRequest(query);
    if (query.isEmpty) {
      return await http.put(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          body: jsonEncode(body),
          headers: headers);
    } else {
      return await http.put(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          body: jsonEncode(body),
          headers: headers);
    }
  }

  Future<http.Response> delete({required String url, required path,}) async {
    return await http.delete(
        ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
        headers: headers);
  }

  Future<http.Response> postWithMultiFile({
    required String url,
    required Map data,
    required List<File> files,
    String? imageKey
  }) async {
    var multiPartRequest = http.MultipartRequest(
        'POST', Uri.parse('https://${AppConstantManager.baseUrl}/$url'));

    for (var image in files) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        imageKey ??'photos[]',
        stream,
        length,
        filename: basename(image.path),
      );
      multiPartRequest.files.add(multipartFile);
    }

    multiPartRequest.headers.addAll({
      'Authorization': 'Bearer ${AppSharedPreferences.getToken()}',
    });

    data.forEach((key, value) {
      multiPartRequest.fields[key.toString()] = value.toString();
    });

    http.StreamedResponse response = await multiPartRequest.send();
    return await http.Response.fromStream(response);
  }
}
