import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

abstract class LikesRepository {
  Future<Either<ApiFailure, LikesResponseEntity>>
  getItemsHasReactions({
    required LikesRequestEntity entity,
  });

  }