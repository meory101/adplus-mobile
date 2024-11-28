import 'dart:convert';
import 'dart:io';

import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../domain/entity/request/verfiy_username_request_entity.dart';
import '../../domain/entity/response/verfiy_username_response_entity.dart';

abstract class MoreRemote {
  Future<UpdateUsernameResponseEntity> updateusername({
    required UpdateUsernameRequestEntity entity,
  });

  Future<VerifyUsernameResponseEntity> verfiyusername({
    required VerifyUsernameRequestEntity entity,
  });

  Future<EditPasswordResponseEntity> editpassword({
    required EditPasswordRequestEntity entity,
  });

  Future<MyItemResponseEntity> myitem({
    required MyItemRequestEntity entity,
  });

  Future<MyItemResponseEntity> myitemunderreview({
    required MyItemUnderReviewRequestEntity entity,
  });

  Future<MyItemResponseEntity> myitemreview({
    required MyItemReviewRequestEntity entity,
  });

  Future<MyItemResponseEntity> myRejectedAds({
    required MyItemRequestEntity entity,
  });

  Future<bool> convertToBusinessAccount({
    required File? file,
  });
}

class MoreRemoteImplement extends MoreRemote {
  @override
  Future<UpdateUsernameResponseEntity> updateusername(
      {required UpdateUsernameRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.updateUsername, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return updateUsernameResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<VerifyUsernameResponseEntity> verfiyusername(
      {required VerifyUsernameRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.verfiyusername, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return verifyUsernameResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<EditPasswordResponseEntity> editpassword(
      {required EditPasswordRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.editpassword, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return editPasswordResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> myitem(
      {required MyItemRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.myitem, body: entity.toJson());

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> myitemunderreview(
      {required MyItemUnderReviewRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.myitemunderreview, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> myitemreview(
      {required MyItemReviewRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.myitemreview, body: entity.toJson());

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> myRejectedAds(
      {required MyItemRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.myRefusedItems, body: entity.toJson());

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> convertToBusinessAccount({required File? file}) async {
    final response = await ApiMethods()
        .postWithMultiFile(
        data: {}, files: [file!], url: ApiPostUrl.uploadfile, imageKey: 'file');

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }
}
