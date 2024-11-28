import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/check_like_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_company_account_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_company_accounts_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class GetCompanyAccountsUsecase {
  final HomeRepository repository;

  GetCompanyAccountsUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, GetCompanyAccountsResponseEntity>> call(
      {required GetCompanyAccountRequestEntity entity}) async {
    return await repository.getCompanyAccounts(entity: entity);
  }
}
