import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/response/update_profile_response_entity.dart';

/// Eng.Hussaen  Baghdadi

class UpdateUsernameUsecase {
  final ProfileRepository repository;

  UpdateUsernameUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, UpdateUsernameResponseEntity>> call(
      {required UpdateUsernameRequestEntity entity}) async {
    return await repository.updateUsername(entity: entity);
  }
}
