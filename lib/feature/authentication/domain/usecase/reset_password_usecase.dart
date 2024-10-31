import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/reset_passwod_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/resert_password_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen Baghdadi*

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, ResetPasswordResponse>> call({
    required PasswordResetRequestEntity entity,
  }) async {
    return await repository.resetPassword(entity: entity);
  }
}
