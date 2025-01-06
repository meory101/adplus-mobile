import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/add_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/check_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/remove_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/add_follow_response.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/check_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/profile_by_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/remove_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';

/// Eng.Nour Othman(meory)*

class ProfileRepositoryImplements implements ProfileRepository {
  final ProfileRemote remote;

  ProfileRepositoryImplements({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetProfileInfoResponseEntity>>
      getProfileInfo() async {
    return Connector<GetProfileInfoResponseEntity>().connect(
      remote: () async {
        final result = await remote.getProfileInfo();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, UpdateProfileResponseEntity>> updateProfile(
      {required UpdateProfileRequestEntity entity}) async {
    return Connector<UpdateProfileResponseEntity>().connect(
      remote: () async {
        final result = await remote.updateProfile(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> updateProfileImage(
      {required File profileImage}) {
    return Connector<bool>().connect(
      remote: () async {
        final result =
            await remote.updateProfileImage(profileImage: profileImage);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyFollowersResponseEntity>> getMyFollowers({
    required MyFollowersRequestEntity entity,
  }) async {
    return Connector<MyFollowersResponseEntity>().connect(
      remote: () async {
        final result = await remote.getMyFollowers(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyFollowingResponseEntity>> getMyFollowing({
    required MyFollowingRequestEntity entity,
  }) async {
    return Connector<MyFollowingResponseEntity>().connect(
      remote: () async {
        final result = await remote.getMyFollowing(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, ProfileByUsernameResponseEntity>>
      getProfileByUsername({
    required ProfileByUsernameRequestEntity entity,
  }) async {
    return Connector<ProfileByUsernameResponseEntity>().connect(
      remote: () async {
        final result = await remote.getProfileByUsername(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, AddFollowResponseEntity>> addFollow({
    required AddFollowRequestEntity entity,
  }) async {
    return Connector<AddFollowResponseEntity>().connect(
      remote: () async {
        final result = await remote.addFollow(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, RemoveFollowResponseEntity>> removeFollow({
    required RemoveFollowRequestEntity entity,
  }) async {
    return Connector<RemoveFollowResponseEntity>().connect(
      remote: () async {
        final result = await remote.removeFollow(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, CheckFollowResponseEntity>> checkFollow({required CheckFollowRequestEntity entity}) async{
    return Connector<CheckFollowResponseEntity>().connect(
      remote: () async {
        final result = await remote.checkFollow(entity: entity);
        return Right(result);
      },
    );
  }
}
