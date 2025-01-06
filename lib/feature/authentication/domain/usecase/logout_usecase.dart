import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart'; // تأكد من استيراد LogoutResponseEntity
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, LogoutResponseEntity>> call() async {
    return await repository.logout();
  }
}
