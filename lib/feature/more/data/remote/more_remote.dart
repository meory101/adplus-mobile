import 'dart:io';

import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
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
}
