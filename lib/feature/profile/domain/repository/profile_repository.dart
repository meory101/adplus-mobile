import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/add_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/remove_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/add_follow_response.dart';
 import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/profile_by_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/remove_follow_response_entity.dart';
 import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/check_follow_request_entity.dart';
import '../entity/response/check_follow_response_entity.dart';
import '../entity/response/update_profile_response_entity.dart';

/// Eng.Nour Othman(meory)*

abstract class ProfileRepository {
  Future<Either<ApiFailure, GetProfileInfoResponseEntity>> getProfileInfo();
  Future<Either<ApiFailure,UpdateProfileResponseEntity>> updateProfile({required UpdateProfileRequestEntity entity}) ;

  Future<Either<ApiFailure,bool>>updateProfileImage({required File profileImage});
   Future<Either<ApiFailure, MyFollowersResponseEntity>> getMyFollowers({
    required MyFollowersRequestEntity entity,
  });
   Future<Either<ApiFailure, MyFollowingResponseEntity>> getMyFollowing({
    required MyFollowingRequestEntity entity,
  });
   Future<Either<ApiFailure, ProfileByUsernameResponseEntity>> getProfileByUsername({
    required ProfileByUsernameRequestEntity entity,
  });
   Future<Either<ApiFailure, AddFollowResponseEntity>> addFollow({
    required AddFollowRequestEntity entity,
  });
   Future<Either<ApiFailure, RemoveFollowResponseEntity>> removeFollow({
    required RemoveFollowRequestEntity entity,
  });

  Future <Either<ApiFailure, CheckFollowResponseEntity>> checkFollow({required CheckFollowRequestEntity entity});

}
