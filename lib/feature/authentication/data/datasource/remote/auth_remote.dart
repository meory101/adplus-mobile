import 'dart:convert';

import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/forget_password_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/reset_passwod_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
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

abstract class AuthRemote {
  Future<LoginResponseEntity> login({required LoginRequestEntity entity});
  Future<LogoutResponseEntity> logout();
  Future<RegisterResponseEntity> register(
      {required RegisterRequestEntity entity});
  //////////////////
  Future<VerificationResponseEntity> verfication(
      {required VerificationRequestEntity entity});
        Future<ResetPasswordResponse> resetPassword({required PasswordResetRequestEntity entity}); 
         Future<ForgetPasswordResponseEntity> forgetpassword({required ForgetPasswordRequestEntity entity}); // أضف هذه السطر


}

class AuthRemoteImplement extends AuthRemote {
  @override
  Future<LoginResponseEntity> login(
      {required LoginRequestEntity entity}) async {
    print(AppSharedPreferences.getToken());
    print('tollllll');

    final response =
        await ApiMethods().post(body: entity.toJson(), url: ApiPostUrl.login);
    print("looooooooooooogin");
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return loginResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<LogoutResponseEntity> logout() async {
    final response = await ApiMethods().get(url: ApiGetUrl.logout);
    print("looooooooooooogout");
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
    print("verfiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiication");
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return verificationResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
   Future<ResetPasswordResponse> resetPassword({required PasswordResetRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.resetPassword); // تأكد من أن لديك عنوان URL الصحيح
    print("Resetting password");
    print(response.body);
    print(response.statusCode);
    
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return resetPasswordResponseFromJson(response.body); // تأكد من وجود هذه الدالة لتحويل JSON إلى الكائن
    } else {
      throw ApiServerException(response: response);
    }
  }
 Future<ForgetPasswordResponseEntity> forgetpassword({required ForgetPasswordRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.forgetpassword); // تأكد من أن لديك عنوان URL الصحيح
    print("forget password");
    print(response.body);
    print(response.statusCode);
    
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return forgetPasswordResponseEntityFromJson(response.body); // تأكد من وجود هذه الدالة لتحويل JSON إلى الكائن
    } else {
      throw ApiServerException(response: response);
    }
  }

}
