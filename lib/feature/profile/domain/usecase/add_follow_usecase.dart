import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/add_follow_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/add_follow_response.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen Baghdadi

class AddFollowUsecase {
  final ProfileRepository repository;

  AddFollowUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, AddFollowResponseEntity>> call({
    required AddFollowRequestEntity entity,
  }) async {
    return await repository.addFollow(entity: entity);
  }
}