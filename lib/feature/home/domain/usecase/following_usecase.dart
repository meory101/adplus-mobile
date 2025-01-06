import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/followers_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/followers_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class FollowingUsecase {
  final HomeRepository repository;

  FollowingUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, FollowersResponseEntity>> call({required FollowersRequestEntity entity }) async {
    return await repository.getFollowings(entity: entity);
  }
}
