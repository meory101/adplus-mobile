import 'dart:convert';

import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/register_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/register_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class AuthRemote {
  Future<LoginResponseEntity> login({required LoginRequestEntity entity});
  Future<LogoutResponseEntity> logout();
  Future<RegisterResponseEntity> register(
      {required RegisterRequestEntity entity});
      //////////////////
       Future<VerificationResponseEntity> verfication(
      {required VerificationRequestEntity entity});
}

class AuthRemoteImplement extends AuthRemote {
  @override
  Future<LoginResponseEntity> login(
      {required LoginRequestEntity entity}) async {
    final response =
        await ApiMethods().post(body: entity.toJson(), url: ApiPostUrl.login);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return loginResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<LogoutResponseEntity> logout() async {
    final response = await ApiMethods().get(url: ApiGetUrl.logout);
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return logoutResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<RegisterResponseEntity> register(
      {required RegisterRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.register);
    print("regissssssssssssssssssssssster");
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return registerResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<VerificationResponseEntity> verfication(
      {required VerificationRequestEntity entity}) async {
    final response =
        await ApiMethods().post(body: entity.toJson(), url: ApiPostUrl.login);
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return verificationResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
