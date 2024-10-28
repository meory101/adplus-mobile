import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/authentication/data/datasource/remote/auth_remote.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/login_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/response/logout_response_entity.dart';
import 'package:mzad_damascus/feature/authentication/domain/repository/auth_repository.dart';
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/request/login_request_entity.dart';

/// Eng.Nour Othman(meory)*

class AuthRepositoryImplements implements AuthRepository {
  final AuthRemote remote;

  AuthRepositoryImplements({
    required this.remote,
  });

  @override
  
  Future<Either<ApiFailure, LoginResponseEntity>> login({required LoginRequestEntity entity}) async {
    return Connector<LoginResponseEntity>().connect(
      remote: () async {

        final result = await remote.login(entity: entity);
        return Right(result);
      },
    );
  }

 @override
  Future<Either<ApiFailure, LogoutResponseEntity>> logout() async {
    return Connector<LogoutResponseEntity>().connect(
      remote: () async {
        final result = await remote.logout(); // استخدم دالة logout من AuthRemote
        return Right(result);
      },
    );
  }
}
