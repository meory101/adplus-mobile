import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
 import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
 import '../../../../core/api/api_error/api_failures.dart';
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
}
