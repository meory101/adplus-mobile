import 'dart:io';

import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class ProfileRemote {
  Future<GetProfileInfoResponseEntity> getProfileInfo();

  Future<UpdateProfileResponseEntity> updateProfile({
    required UpdateProfileRequestEntity entity,
  });

  Future<bool> updateProfileImage({
    required File profileImage,
  });

}

class ProfileRemoteImplement extends ProfileRemote {
  @override
  Future<GetProfileInfoResponseEntity> getProfileInfo() async {
    final response = await ApiMethods().get(url: ApiGetUrl.getProfileInfo);
    print("profileeeeeeeeeeeeeeeeeee");
    print(AppSharedPreferences.getToken());
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getProfileInfoResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<UpdateProfileResponseEntity> updateProfile(
      {required UpdateProfileRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(url: ApiPostUrl.updateProfile, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return updateProfileResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> updateProfileImage({required File profileImage}) async {
    final response = await ApiMethods().postWithMultiFile(
        data: {},
        files: [profileImage],
        url: ApiPostUrl.updateProfileImage,
        imageKey: 'image');
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  
}
