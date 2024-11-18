import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/favorites_request_entity.dart';
import '../entity/response/check_favorite_response_entity.dart';
import '../entity/response/favorites_response_entity.dart';

/// Eng.Nour Othman(meory)*

abstract class FavoriteRepository {
  Future<Either<ApiFailure, bool>>
  addFavorite({
    required FavoriteRequestEntity entity,
  });

  Future<Either<ApiFailure, CheckFavoriteResponseEntity>>
  checkFavorite({
    required FavoriteRequestEntity entity,
  });

  Future<Either<ApiFailure, FavoritesResponseEntity>> getMyFavorites(
      {required MyFavoritesRequestEntity entity});
    Future<Either<ApiFailure, bool>>
    removeFavorite({
      required FavoriteRequestEntity entity,
    });
  }