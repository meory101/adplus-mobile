import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class AddCommentUsecase {
  final HomeRepository repository;

  AddCommentUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required AddCommentRequestEntity entity,}) async {
    return await repository.addComment(entity: entity);
  }
}
