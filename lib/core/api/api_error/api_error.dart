import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/bottom_sheet/login_bottom_sheet.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/router/router.dart';

import 'api_error_method.dart';
import 'api_error_response_entity.dart';
import 'api_failures.dart';
import 'api_status_code.dart';

class ErrorEntity {
  String errorMessage;
  int statusCode;
  int errorCode;

  ErrorEntity({
    this.errorMessage = '',
    this.errorCode = 0,
    this.statusCode = 0,
  });
}

//Function To Handel Failure Of Api Calls
//By Mapping Abstract Faliure Classes (Server Failure, Empty Cache Failure ,Offline Failure)

abstract class ApiErrorHandler {
  static Future<ErrorEntity> mapFailure({
   required BuildContext buildContext,
    required ApiFailure failure,
  }) {
    ErrorEntity errorEntity = ErrorEntity();
    switch (failure.runtimeType) {
      case const (ApiServerFailure):
        {
          return handleApiServerFailure(
              buildContext: buildContext,
              failure: failure as ApiServerFailure,
              errorEntity: errorEntity);
        }
      case const (EmptyApiCacheFailure):
        {
          return handleEmptyApiCacheFailure(
              failure: failure as EmptyApiCacheFailure,
              errorEntity: errorEntity);
        }
      case const (OfflineApiFailure):
        {
          return handleOfflineApiFailure(
              failure: failure as OfflineApiFailure, errorEntity: errorEntity);
        }
      default:
        {
          errorEntity.errorMessage = "someThingWentWrong";
          return Future.value(errorEntity);
        }
    }
  }

  static Future<ErrorEntity> handleApiServerFailure(
      {required BuildContext buildContext,
      required ApiServerFailure failure,
      required ErrorEntity errorEntity}) {
    if ((failure.response?.body ?? "").isNotEmpty) {
      final ErrorResponseEntity errorResponseEntity;
      try {
        errorResponseEntity = errorResponseEntityFromJson(
            jsonDecode(failure.response?.body ?? "")['errors'] ?? '{}');

        errorEntity.errorMessage =
            jsonDecode(failure.response?.body ?? "")['errors'].toString();
        errorEntity.statusCode = failure.response?.statusCode ?? 0;
        errorEntity.errorCode = errorResponseEntity.errorCode;
        if (jsonDecode(failure.response?.body ?? "")['errors'].toString() ==
            'Unauthenticated.') {
          AppSharedPreferences.cashToken(token: "");
          showLoginBottomSheet(context: buildContext);
        }
      } catch (e) {
        errorEntity.errorMessage =
            jsonDecode(failure.response?.body ?? "")['errors'].toString();

        if (jsonDecode(failure.response?.body ?? "")['errors'].toString() ==
            'Unauthenticated.') {
          AppSharedPreferences.cashToken(token: "");
          showLoginBottomSheet(context: buildContext);

        }
      }
    }
    return Future.value(errorEntity);
  }

  static Future<ErrorEntity> handleEmptyApiCacheFailure(
      {required EmptyApiCacheFailure failure,
      required ErrorEntity errorEntity}) {
    errorEntity.errorMessage = "thereIsNoCachedData";
    return Future.value(errorEntity);
  }

  static Future<ErrorEntity> handleOfflineApiFailure(
      {required OfflineApiFailure failure, required ErrorEntity errorEntity}) {
    errorEntity.errorMessage = failure.message;
    return Future.value(errorEntity);
  }
}
