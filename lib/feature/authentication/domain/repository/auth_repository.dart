import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class AuthRepository {
  Future<Either<ApiFailure, LoginResponseEntity>> login({required LoginRequestEntity entity});

}
