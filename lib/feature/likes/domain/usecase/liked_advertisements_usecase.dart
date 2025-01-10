import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/repository/likes_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class LikesUsecase
{
  final LikesRepository repository;

  LikesUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, LikesResponseEntity>> call(
      {required LikesRequestEntity entity}) async {
    return await repository.getItemsHasReactions(entity: entity);
  }
}
