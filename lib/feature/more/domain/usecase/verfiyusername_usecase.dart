import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/verfiy_username_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen  Baghdadi

class VerfiyusernameUsecase {
  final MoreRepository repository;

  VerfiyusernameUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, VerifyUsernameResponseEntity>> call(
      {required VerifyUsernameRequestEntity entity}) async {
    return await repository.verfiyusername(entity: entity);
  }
}
