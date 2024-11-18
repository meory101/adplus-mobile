import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class CommentsRepository {
  Future<Either<ApiFailure, CommentsResponseEntity>>
  getMyComments();

  }