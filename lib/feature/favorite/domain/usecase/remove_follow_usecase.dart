
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/favorite_request_entity.dart';
import '../repository/favorite_repository.dart';

class RemoveFavoriteUscase {
  final FavoriteRepository repository;

  RemoveFavoriteUscase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call(
      {required FavoriteRequestEntity entity}) async {
    return await repository.removeFavorite(entity: entity);
  }
}