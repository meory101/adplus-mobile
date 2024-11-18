import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';

class MyitemUnderReviewUsecase {
  final MoreRepository repository;

  MyitemUnderReviewUsecase({required this.repository});
   Future<Either<ApiFailure, MyItemResponseEntity>> call(
      {required MyItemUnderReviewRequestEntity entity}) async {
    return await repository.myitemunderreview(entity: entity);
  }
}
