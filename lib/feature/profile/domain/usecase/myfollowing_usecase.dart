import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/myfolloweing_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen baghdadi()*

class GetMyFollowingUsecase {
  final ProfileRepository repository;

  GetMyFollowingUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, MyFollowingResponseEntity>> call({
    required MyFollowingRequestEntity entity,
  }) async {
    return await repository.getMyFollowing(entity: entity);
  }
}