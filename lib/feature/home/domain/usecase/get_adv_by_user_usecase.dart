import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../more/domain/entity/response/myitems_response_entity.dart';
import '../entity/request/get_advs_by_user_request_entity.dart';

/// Eng.Nour Othman(meory)*

class GetAdvByUserUsecase {
  final HomeRepository repository;

  GetAdvByUserUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, MyItemResponseEntity>> call({required GetAdvsByUserRequestEntity entity }) async {
    return await repository.getAdvByUser(entity: entity);
  }
}
