import 'dart:convert';

import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/forget_password_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/reset_passwod_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/check_update_availability_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/forget_password_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/register_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/register_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/resert_password_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
bool auth = false;
abstract class AuthRemote {
  Future<LoginResponseEntity> login({required LoginRequestEntity entity});
  Future<LogoutResponseEntity> logout();
  Future<RegisterResponseEntity> register(
      {required RegisterRequestEntity entity});
  //////////////////
  Future<VerificationResponseEntity> verfication(
      {required VerificationRequestEntity entity});
  Future<ResetPasswordResponse> resetPassword(
      {required PasswordResetRequestEntity entity});
  Future<ForgetPasswordResponseEntity> forgetpassword(
      {required ForgetPasswordRequestEntity entity});
  Future<CheckUpdateAvailabilityResponseEntity> checkupdate();
}

class AuthRemoteImplement extends AuthRemote {
  @override
  Future<LoginResponseEntity> login(
      {required LoginRequestEntity entity}) async {
    auth=true;
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
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return logoutResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<RegisterResponseEntity> register(
      {required RegisterRequestEntity entity}) async {
    print(entity.whatsapp);
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.register);
    print(response.statusCode);
    print(response.body);

    print('-------------------------------------------------');
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

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return verificationResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      {required PasswordResetRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.resetPassword);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return resetPasswordResponseFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<ForgetPasswordResponseEntity> forgetpassword(
      {required ForgetPasswordRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.forgetpassword);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return forgetPasswordResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<CheckUpdateAvailabilityResponseEntity> checkupdate()async {
    final response = await ApiMethods()
        .post(body:{}, url: ApiPostUrl.checkupdate);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return checkUpdateAvailabilityResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
