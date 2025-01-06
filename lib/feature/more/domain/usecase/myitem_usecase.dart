import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/core/api/api_error/api_failures.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';

class MyitemUsecase {
  final MoreRepository repository;

  MyitemUsecase({required this.repository});
   Future<Either<ApiFailure, MyItemResponseEntity>> call(
      {required MyItemRequestEntity entity}) async {
    return await repository.myitem(entity: entity);
  }
}
