import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/comment/data/datasource/remote/comment_remote.dart';
import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/comments_request_entity.dart';
import '../../domain/repository/comments_repository.dart';

/// Eng.Nour Othman(meory)*

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentRemote remote;

  CommentsRepositoryImpl({
    required this.remote,
  });


  @override
  Future<Either<ApiFailure, CommentsResponseEntity>> getMyComments({required CommentsRequestEntity entity}){
    return Connector<CommentsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getMyComments(entity: entity);
        return Right(result);
      },
    );
  }





}
