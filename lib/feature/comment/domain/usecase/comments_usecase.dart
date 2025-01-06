import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import 'package:mzad_damascus/feature/comment/domain/repository/comments_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/comments_request_entity.dart';

/// Eng.Nour Othman(meory)*

class CommentsUsecase
{
  final CommentsRepository repository;

  CommentsUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CommentsResponseEntity>> call({required CommentsRequestEntity entity}) async {
    return await repository.getMyComments(entity: entity);
  }
}
