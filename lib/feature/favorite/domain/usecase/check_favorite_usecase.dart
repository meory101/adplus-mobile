import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/repository/favorite_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/response/check_favorite_response_entity.dart';

/// Eng.Nour Othman(meory)*

class CheckFavoriteUscase {
  final FavoriteRepository repository;

  CheckFavoriteUscase({
    required this.repository,
  });

  Future<Either<ApiFailure, CheckFavoriteResponseEntity>> call(
      {required FavoriteRequestEntity entity}) async {
    return await repository.checkFavorite(entity: entity);
  }
}