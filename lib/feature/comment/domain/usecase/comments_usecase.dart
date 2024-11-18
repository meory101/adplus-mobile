import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import 'package:mzad_damascus/feature/comment/domain/repository/comments_repository.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class CommentsUsecase
{
  final CommentsRepository repository;

  CommentsUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, CommentsResponseEntity>> call() async {
    return await repository.getMyComments();
  }
}
