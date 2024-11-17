import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/repository/favorite_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class AddFavoriteUscase {
  final FavoriteRepository repository;

  AddFavoriteUscase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call(
      {required FavoriteRequestEntity entity}) async {
    return await repository.addFavorite(entity: entity);
  }
}
