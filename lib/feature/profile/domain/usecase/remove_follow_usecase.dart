import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/remove_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/remove_follow_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

class RemoveFollowUsecase {
  final ProfileRepository repository;

  RemoveFollowUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, RemoveFollowResponseEntity>> call({
    required RemoveFollowRequestEntity entity,
  }) async {
    return await repository.removeFollow(entity: entity);
  }
}