import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/check_like_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/check_like_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class CheckLikeUsecase {
  final HomeRepository repository;

  CheckLikeUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CheckLikeResponseEntity>> call({required CheckLikeRequestEntity entity}) async {
    return await repository.checkLike(entity: entity);
  }
}
