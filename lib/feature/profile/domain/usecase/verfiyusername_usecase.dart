import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/verfiy_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/response/update_profile_response_entity.dart';

/// Eng.Hussaen  Baghdadi

class VerfiyusernameUsecase {
  final ProfileRepository repository;

  VerfiyusernameUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, VerifyUsernameResponseEntity>> call(
      {required VerifyUsernameRequestEntity entity}) async {
    return await repository.verfiyusername(entity: entity);
  }
}
