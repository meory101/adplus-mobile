import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/search_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/search_user_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class SearchUserUsecase {
  final HomeRepository repository;

  SearchUserUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, SearchUserResponseEntity>> call({
    required SearchUserRequestEntity entity,
  }) async {
    return await repository.searchUser(entity: entity);
  }
}
