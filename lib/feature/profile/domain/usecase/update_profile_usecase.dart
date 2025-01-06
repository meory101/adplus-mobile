import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/response/update_profile_response_entity.dart';

/// Eng.Nour Othman(meory)*

class UpdateProfileUsecase {
  final ProfileRepository repository;

  UpdateProfileUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, UpdateProfileResponseEntity>> call(
      {required UpdateProfileRequestEntity entity}) async {
    return await repository.updateProfile(entity: entity);
  }
}
