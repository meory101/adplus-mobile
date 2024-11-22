import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/more/data/remote/more_remote.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/verfiy_username_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';
import 'package:mzad_damascus/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';

/// Eng.Nour Othman(meory)*

class MoreRepositoryImplements implements MoreRepository {
  final MoreRemote remote;

  MoreRepositoryImplements({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, UpdateUsernameResponseEntity>> updateUsername(
      {required UpdateUsernameRequestEntity entity}) async {
    return Connector<UpdateUsernameResponseEntity>().connect(
      remote: () async {
        final result = await remote.updateusername(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, VerifyUsernameResponseEntity>> verfiyusername(
      {required VerifyUsernameRequestEntity entity}) async {
    return Connector<VerifyUsernameResponseEntity>().connect(
      remote: () async {
        final result = await remote.verfiyusername(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, EditPasswordResponseEntity>> editpassword(
      {required EditPasswordRequestEntity entity}) async {
    return Connector<EditPasswordResponseEntity>().connect(
      remote: () async {
        final result = await remote.editpassword(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyItemResponseEntity>> myitem({
    required MyItemRequestEntity entity,
  }) async {
    return Connector<MyItemResponseEntity>().connect(
      remote: () async {
        final result = await remote.myitem(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyItemResponseEntity>> myitemunderreview({
    required MyItemUnderReviewRequestEntity entity,
  }) async {
    return Connector<MyItemResponseEntity>().connect(
      remote: () async {
        final result = await remote.myitemunderreview(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyItemResponseEntity>> myitemreview({
    required MyItemReviewRequestEntity entity,
  }) async {
    return Connector<MyItemResponseEntity>().connect(
      remote: () async {
        final result = await remote.myitemreview(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyItemResponseEntity>> myRejectedAds({required MyItemRequestEntity entity})async {
    return Connector<MyItemResponseEntity>().connect(
      remote: () async {
        final result = await remote.myRejectedAds(entity: entity);
        return Right(result);
      },
    );
  }
}
