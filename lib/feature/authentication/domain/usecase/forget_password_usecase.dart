import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/forget_password_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/forget_password_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/login_request_entity.dart';

/// Eng.Nour Othman(meory)*

class ForgetPasswordUsecase {
  final AuthRepository repository;

  ForgetPasswordUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, ForgetPasswordResponseEntity>> call(
      {required ForgetPasswordRequestEntity entity}) async {
    return await repository.forgetpassword(entity: entity);
  }
}
