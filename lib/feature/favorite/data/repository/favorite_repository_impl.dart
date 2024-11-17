import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/advertisement/data/datasource/remote/advertisement_remote.dart';
import 'package:mzad_damascus/feature/favorite/data/datasource/remote/favorite_remote.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/check_favorite_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/favorites_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/request/favorite_request_entity.dart';
import '../../domain/repository/favorite_repository.dart';

/// Eng.Nour Othman(meory)*

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemote remote;

  FavoriteRepositoryImpl({
    required this.remote,
  });


  @override
  Future<Either<ApiFailure, CheckFavoriteResponseEntity>> checkFavorite({required FavoriteRequestEntity entity}) {
    return Connector<CheckFavoriteResponseEntity>().connect(
      remote: () async {
        final result = await remote.checkFavorite(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> removeFavorite({required FavoriteRequestEntity entity}) {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.removeFavorite(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> addFavorite({required FavoriteRequestEntity entity}) {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.addFavorite(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, FavoritesResponseEntity>> getMyFavorites({required FavoriteRequestEntity entity}) async{
    return Connector<FavoritesResponseEntity>().connect(
      remote: () async {
        final result = await remote.getMyFavorites(entity: entity);
        return Right(result);
      },
    );
  }
}
