import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/favorites_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/repository/favorite_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/favorites_request_entity.dart';
import '../entity/response/check_favorite_response_entity.dart';

/// Eng.Nour Othman(meory)*

class FavoritesUsecase {
  final FavoriteRepository repository;

  FavoritesUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, FavoritesResponseEntity>> call(
      {required MyFavoritesRequestEntity entity}) async {
    return await repository.getMyFavorites(entity: entity);
  }
}