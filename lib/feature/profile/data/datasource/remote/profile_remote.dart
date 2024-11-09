import 'dart:io';

import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/remove_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/add_follow_response.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/profile_by_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/remove_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';

import '../../../domain/entity/request/add_follow_request_entity.dart';

abstract class ProfileRemote {
  Future<GetProfileInfoResponseEntity> getProfileInfo();

  Future<UpdateProfileResponseEntity> updateProfile({
    required UpdateProfileRequestEntity entity,
  });

  Future<bool> updateProfileImage({
    required File profileImage,
  });
  Future<MyFollowersResponseEntity> getMyFollowers(
      {required MyFollowersRequestEntity entity});
  Future<MyFollowingResponseEntity> getMyFollowing(
      {required MyFollowingRequestEntity entity});
  Future<ProfileByUsernameResponseEntity> getProfileByUsername({
    required ProfileByUsernameRequestEntity entity,
  });
   Future<AddFollowResponseEntity> addFollow({
    required AddFollowRequestEntity entity,
  });
  Future<RemoveFollowResponseEntity> removeFollow({
    required RemoveFollowRequestEntity entity,
  });

}


class ProfileRemoteImplement extends ProfileRemote {
  @override
  Future<GetProfileInfoResponseEntity> getProfileInfo() async {
    final response = await ApiMethods().get(url: ApiGetUrl.getProfileInfo);
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
    print("sssssssssssssssssss");
    print(response.body);
    print(response.statusCode);
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
    print("sssssssssssssssssss");
    print(response.body);
    print(response.statusCode);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyFollowersResponseEntity> getMyFollowers({
    required MyFollowersRequestEntity entity,
  }) async {
    final response = await ApiMethods().post(
      url: "${ApiPostUrl.myfollower}?page=${entity.page}",
    );
    print("sssssssssssssssssss");
    print(response.body);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myFollowersResponseEntityFromJson(response.body);
    } else {
      print("sssssssssssssssssss");
      print(response.body);
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyFollowingResponseEntity> getMyFollowing({
    required MyFollowingRequestEntity entity,
  }) async {
    final response = await ApiMethods().post(
      url: "${ApiPostUrl.myfolloweing}?page=${entity.page}",
    );

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myFollowingResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<ProfileByUsernameResponseEntity> getProfileByUsername({
    required ProfileByUsernameRequestEntity entity,
  }) async {
    final response = await ApiMethods().post(
      url: ApiPostUrl.profilebyusername,
      body: entity.toJson(),
    );

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return profileByUsernameResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
   @override
  Future<AddFollowResponseEntity> addFollow({
    required AddFollowRequestEntity entity,
  }) async {
    final response = await ApiMethods().post(
      url: ApiPostUrl.addfollow,
      body: entity.toJson(),
    );

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return addFollowResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
   @override
  Future<RemoveFollowResponseEntity> removeFollow({
    required RemoveFollowRequestEntity entity,
  }) async {
    final response = await ApiMethods().post(
      url: ApiPostUrl.removefollow,
      body: entity.toJson(),
    );

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return removeFollowResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
