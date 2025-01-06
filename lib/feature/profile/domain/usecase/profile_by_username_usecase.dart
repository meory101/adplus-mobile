import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/profile_by_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/profile_by_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen Baghdadi

class GetProfileByUsernameUsecase {
  final ProfileRepository repository;

  GetProfileByUsernameUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, ProfileByUsernameResponseEntity>> call({
    required ProfileByUsernameRequestEntity entity,
  }) async {
    return await repository.getProfileByUsername(entity: entity);
  }
}