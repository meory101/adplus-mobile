import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class ProfileRepository {
  Future<Either<ApiFailure, GetProfileInfoResponseEntity>> getProfileInfo();

}
