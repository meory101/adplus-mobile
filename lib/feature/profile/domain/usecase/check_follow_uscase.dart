import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/check_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/check_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

class CheckFollowUscase {
  final ProfileRepository repository;

  CheckFollowUscase({
    required this.repository,
  });

  Future<Either<ApiFailure, CheckFollowResponseEntity>> call({
    required CheckFollowRequestEntity entity,
  }) async {
    return await repository.checkFollow(entity: entity);
  }
}