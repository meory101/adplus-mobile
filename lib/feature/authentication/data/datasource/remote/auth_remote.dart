
import 'dart:convert';

import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class AuthRemote {
  Future<LoginResponseEntity> login({required LoginRequestEntity entity});
 Future<bool> logout();

}

class AuthRemoteImplement extends AuthRemote {
  @override
  Future<LoginResponseEntity> login({required LoginRequestEntity entity}) async {
    final response =
    await ApiMethods().post(
      body: entity.toJson(),
        url: ApiPostUrl.login);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return loginResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
 @override
  Future<bool> logout() async {
    final response = await ApiMethods().get(url: ApiPostUrl.logout);  

    if (ApiStatusCode.success().contains(response.statusCode)) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['success'] ?? false;  
    } else {
      throw ApiServerException(response: response);  
    }
  }

}