import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/register_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/register_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/verfication_response.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class AuthRepository {
  Future<Either<ApiFailure, LoginResponseEntity>> login(
      {required LoginRequestEntity entity});
  Future<Either<ApiFailure, LogoutResponseEntity>> logout();
  Future<Either<ApiFailure, RegisterResponseEntity>> register(
      {required RegisterRequestEntity entity});
       Future<Either<ApiFailure, VerificationResponseEntity>> verfication(
      {required VerificationRequestEntity entity});
 }
