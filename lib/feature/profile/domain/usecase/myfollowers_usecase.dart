import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfollower_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen baghdadi()*

class GetMyFollowersUsecase {
  final ProfileRepository repository;

  GetMyFollowersUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, MyFollowersResponseEntity>> call({
    required MyFollowersRequestEntity entity,
  }) async {
    return await repository.getMyFollowers(entity: entity);
  }
}