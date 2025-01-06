import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';
 import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen  Baghdadi

class EditPasswordUsecase {
  final MoreRepository repository;

  EditPasswordUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, EditPasswordResponseEntity>> call(
      {required EditPasswordRequestEntity entity}) async {
    return await repository.editpassword(entity: entity);
  }
}
