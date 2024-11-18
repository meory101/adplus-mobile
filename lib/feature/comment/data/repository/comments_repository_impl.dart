import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/comment/data/datasource/remote/comment_remote.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/data/datasource/remote/favorite_remote.dart';
import 'package:mzad_damascus/feature/likes/data/datasource/remote/likes_remote.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/repository/comments_repository.dart';

/// Eng.Nour Othman(meory)*

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentRemote remote;

  CommentsRepositoryImpl({
    required this.remote,
  });


  @override
  Future<Either<ApiFailure, CommentsResponseEntity>> getMyComments() {
    return Connector<CommentsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getMyComments();
        return Right(result);
      },
    );
  }





}
