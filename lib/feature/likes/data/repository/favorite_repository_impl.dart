import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/favorite/data/datasource/remote/favorite_remote.dart';
import 'package:mzad_damascus/feature/likes/data/datasource/remote/likes_remote.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/repository/favorite_repository.dart';

/// Eng.Nour Othman(meory)*

class LikesRepositoryImpl implements LikesRepository {
  final LikesRemote remote;

  LikesRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, LikesResponseEntity>> getItemsHasReactions({required LikesRequestEntity entity}) {
    return Connector<LikesResponseEntity>().connect(
      remote: () async {
        final result = await remote.getItemsHasReactions(entity: entity);
        return Right(result);
      },
    );
  }





}
