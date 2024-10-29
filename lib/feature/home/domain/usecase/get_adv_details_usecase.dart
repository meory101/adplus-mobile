import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/advs_by_attribute_request_entity.dart';

/// Eng.Nour Othman(meory)*

class GetAdvDetailsUsecase {
  final HomeRepository repository;

  GetAdvDetailsUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, GetAdvDetailsResponseEntity>> call({required GetAdvDetailsRequestEntity entity,}) async {
    return await repository.getAdvDetails(entity: entity);
  }
}
