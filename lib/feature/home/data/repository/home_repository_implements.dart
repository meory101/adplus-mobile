import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/repository/home_repository.dart';

/// Eng.Nour Othman(meory)*

class HomeRepositoryImplements implements HomeRepository {
  final HomeRemote remote;

  HomeRepositoryImplements({
    required this.remote,
  });

  @override
  Future<Either<ApiFailure, GetCategoriesResponseEntity>>
      getCategories() async {
    return Connector<GetCategoriesResponseEntity>().connect(
      remote: () async {
        final result = await remote.getCategories();
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, CategoryInsidePageResponseEntity>>
      getCategoryInsidePage({required CategoryInsidePageRequestEntity entity}) {
    return Connector<CategoryInsidePageResponseEntity>().connect(
      remote: () async {
        final result = await remote.getCategoryInsidePage(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, AdvsByAttributeResponseEntity>> getAdvsByAttribute({required AdvsByAttributeRequestEntity entity}) {
    return Connector<AdvsByAttributeResponseEntity>().connect(
      remote: () async {
        final result = await remote.getAdvsByAttribute(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, GetAdvDetailsResponseEntity>> getAdvDetails({required GetAdvDetailsRequestEntity entity})async {
    return Connector<GetAdvDetailsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getAdvDetails(entity: entity);
        return Right(result);
      },
    );
  }
}
