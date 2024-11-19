import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/data/datasource/remote/home_remote.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/check_like_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_advs_by_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/search_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/check_like_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_comments_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/search_user_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../../core/api/connector.dart';
import '../../domain/entity/request/add_comment_request_entity.dart';
import '../../domain/entity/request/add_reaction_request_entity.dart';
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
  Future<Either<ApiFailure, AdvsByAttributeResponseEntity>> getAdvsByAttribute(
      {required AdvsByAttributeRequestEntity entity}) {
    return Connector<AdvsByAttributeResponseEntity>().connect(
      remote: () async {
        final result = await remote.getAdvsByAttribute(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, GetAdvDetailsResponseEntity>> getAdvDetails(
      {required GetAdvDetailsRequestEntity entity}) async {
    return Connector<GetAdvDetailsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getAdvDetails(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> addComment(
      {required AddCommentRequestEntity entity}) async {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.addComment(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, GetCommentsResponseEntity>> getComments(
      {required GetCommentsRequestEntity entity}) async {
    return Connector<GetCommentsResponseEntity>().connect(
      remote: () async {
        final result = await remote.getComments(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, BannersResponseEntity>> getBanners({required int source}) {
    return Connector<BannersResponseEntity>().connect(
      remote: () async {
        final result = await remote.getBanners(source: source);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> addReaction({required AddReactionRequestEntity entity}) async{
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.addReaction(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, MyItemResponseEntity>> getAdvByUser({required GetAdvsByUserRequestEntity entity}) async{
    return Connector<MyItemResponseEntity>().connect(
      remote: () async {
        final result = await remote.getAdvByUser(entity: entity);
        return Right(result);
      },
    );
  }

  @override
   Future<Either<ApiFailure, CheckLikeResponseEntity>> checkLike({required CheckLikeRequestEntity entity}) async{
    return Connector<CheckLikeResponseEntity>().connect(
      remote: () async {
        final result = await remote.checkLike(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure, bool>> removeLike({required CheckLikeRequestEntity entity})async {
    return Connector<bool>().connect(
      remote: () async {
        final result = await remote.removeLike(entity: entity);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<ApiFailure,SearchUserResponseEntity>> searchUser({required SearchUserRequestEntity entity})async {
    return Connector<SearchUserResponseEntity>().connect(
      remote: () async {
        final result = await remote.searchUser(entity: entity);
        return Right(result);
      },
    );
  }
}
