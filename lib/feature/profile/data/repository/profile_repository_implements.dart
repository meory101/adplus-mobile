import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/data/datasource/remote/profile_remote.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';

/// Eng.Nour Othman(meory)*

class ProfileRepositoryImplements implements ProfileRepository {
  final ProfileRemote remote;

  ProfileRepositoryImplements({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetProfileInfoResponseEntity>> getProfileInfo() async {
    return Connector<GetProfileInfoResponseEntity>().connect(
      remote: () async {
        final result = await remote.getProfileInfo();
        return Right(result);
      },
    );
  }



}
