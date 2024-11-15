
import 'dart:convert';

import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_comments_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../../more/domain/entity/response/myitems_response_entity.dart';
import '../../../domain/entity/request/add_comment_request_entity.dart';
import '../../../domain/entity/request/advs_by_attribute_request_entity.dart';
import '../../../domain/entity/request/category_inside_page_request_entity.dart';
import '../../../domain/entity/request/get_advs_by_user_request_entity.dart';

abstract class HomeRemote {
  Future<GetCategoriesResponseEntity> getCategories();
  Future<MyItemResponseEntity> getAdvByUser({required GetAdvsByUserRequestEntity entity});
  Future<CategoryInsidePageResponseEntity> getCategoryInsidePage({required CategoryInsidePageRequestEntity entity});
  Future<AdvsByAttributeResponseEntity> getAdvsByAttribute({required AdvsByAttributeRequestEntity entity});
  Future<GetAdvDetailsResponseEntity> getAdvDetails({required GetAdvDetailsRequestEntity entity});
  Future<bool> addComment({required AddCommentRequestEntity entity});
  Future<bool> addReaction({required AddReactionRequestEntity entity});
  Future<BannersResponseEntity> getBanners({required int source});
  Future<GetCommentsResponseEntity> getComments({required GetCommentsRequestEntity entity});

}

class HomeRemoteImplement extends HomeRemote {
  @override
  Future<GetCategoriesResponseEntity> getCategories() async {
    final response =
    await ApiMethods().get(
        url: ApiGetUrl.getCategories);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCategoriesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<CategoryInsidePageResponseEntity> getCategoryInsidePage({required CategoryInsidePageRequestEntity entity}) async{
    final response =
        await ApiMethods().post(
          body: entity.toJson(),
        url: ApiPostUrl.getCategoryInsidePage);
    print(response.body);
    print('-----------------------');
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return categoryInsidePageResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<AdvsByAttributeResponseEntity> getAdvsByAttribute({required AdvsByAttributeRequestEntity entity}) async{
    final response =
        await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.getItemsByAttribute);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return advsByAttributeResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetAdvDetailsResponseEntity> getAdvDetails({required GetAdvDetailsRequestEntity entity})async {
    final response =
        await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.getItemsById);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getAdvDetailsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addComment({required AddCommentRequestEntity entity})async {
    final response =
    await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.addComment);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetCommentsResponseEntity> getComments({required GetCommentsRequestEntity entity}) async{
    final response =
    await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.getComments);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCommentsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<BannersResponseEntity> getBanners({required int source} ) async{
    // source =0 => home;
    // source =1 => insidepage;

    final response =
        await ApiMethods().post(
        body: {},
        url:source==0? ApiPostUrl.getBanners :ApiPostUrl.getInsidePageBanners);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return bannersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addReaction({required AddReactionRequestEntity entity}) async{
    final response =
    await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.addReaction);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> getAdvByUser({required GetAdvsByUserRequestEntity entity})async {
    final response =
    await ApiMethods().post(
        body: entity.toJson(),
        url: ApiPostUrl.itemsByClient);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}