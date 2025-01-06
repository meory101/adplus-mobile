import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';

class MyReviewdIrem {
  final MoreRepository repository;

  MyReviewdIrem({required this.repository});
  Future<Either<ApiFailure, MyItemResponseEntity>> call(
      {required MyItemReviewRequestEntity entity}) async {
    return await repository.myitemreview(entity: entity);
  }
}
