import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class GetProfileInfoUsecase {
  final ProfileRepository repository;

  GetProfileInfoUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, GetProfileInfoResponseEntity>> call() async {
    return await repository.getProfileInfo();
  }
}
