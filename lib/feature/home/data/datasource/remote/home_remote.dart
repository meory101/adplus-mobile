import 'dart:convert';

import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/followers_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_adv_details_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/item_search_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_comments_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/item_search_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/search_user_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../../more/domain/entity/response/myitems_response_entity.dart';
import '../../../domain/entity/request/add_comment_request_entity.dart';
import '../../../domain/entity/request/ads_by_category_request_entity.dart';
import '../../../domain/entity/request/advs_by_attribute_request_entity.dart';
import '../../../domain/entity/request/category_inside_page_request_entity.dart';
import '../../../domain/entity/request/check_like_request_entity.dart';
import '../../../domain/entity/request/get_advs_by_user_request_entity.dart';
import '../../../domain/entity/request/get_company_account_request_entity.dart';
import '../../../domain/entity/request/search_user_request_entity.dart';
import '../../../domain/entity/response/ads_by_category_response_entity.dart';
import '../../../domain/entity/response/check_like_response_entity.dart';
import '../../../domain/entity/response/followers_response_entity.dart';
import '../../../domain/entity/response/get_company_accounts_response_entity.dart';

abstract class HomeRemote {
  Future<GetCategoriesResponseEntity> getCategories();

  Future<AdsByCategoryResponseEntity> getItemsByCategory(
      {required AdsByCategoryRequestEntity entity});

  Future<FollowersResponseEntity> getFollowers(
      {required FollowersRequestEntity entity});

  Future<ItemSearchResponseEntity> itemSearch(
      {required ItemSearchRequestEntity entity});

  Future<FollowersResponseEntity> getFollowings(
      {required FollowersRequestEntity entity});

  Future<SearchUserResponseEntity> searchUser(
      {required SearchUserRequestEntity entity});

  Future<CheckLikeResponseEntity> checkLike(
      {required CheckLikeRequestEntity entity});

  Future<bool> removeLike({required CheckLikeRequestEntity entity});

  Future<MyItemResponseEntity> getAdvByUser(
      {required GetAdvsByUserRequestEntity entity});

  Future<CategoryInsidePageResponseEntity> getCategoryInsidePage(
      {required CategoryInsidePageRequestEntity entity});

  Future<AdvsByAttributeResponseEntity> getAdvsByAttribute(
      {required AdvsByAttributeRequestEntity entity});

  Future<GetAdvDetailsResponseEntity> getAdvDetails(
      {required GetAdvDetailsRequestEntity entity});

  Future<bool> addComment({required AddCommentRequestEntity entity});

  Future<bool> addReaction({required AddReactionRequestEntity entity});

  Future<BannersResponseEntity> getBanners({required int source});

  Future<GetCommentsResponseEntity> getComments(
      {required GetCommentsRequestEntity entity});

  Future<GetCompanyAccountsResponseEntity> getCompanyAccounts(
      {required GetCompanyAccountRequestEntity entity});
}

class HomeRemoteImplement extends HomeRemote {
  @override
  Future<GetCategoriesResponseEntity> getCategories() async {
    final response = await ApiMethods().get(url: ApiGetUrl.getCategories);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCategoriesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<CategoryInsidePageResponseEntity> getCategoryInsidePage(
      {required CategoryInsidePageRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getCategoryInsidePage);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return categoryInsidePageResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<AdvsByAttributeResponseEntity> getAdvsByAttribute(
      {required AdvsByAttributeRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getItemsByAttribute);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return advsByAttributeResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetAdvDetailsResponseEntity> getAdvDetails(
      {required GetAdvDetailsRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getItemsById);
    print(response.body);
    print(response.statusCode);
    print('---------------------------------------------------');
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getAdvDetailsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addComment({required AddCommentRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.addComment);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetCommentsResponseEntity> getComments(
      {required GetCommentsRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getComments);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCommentsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<BannersResponseEntity> getBanners({required int source}) async {
    // source =0 => home;
    // source =1 => insidepage;

    final response = await ApiMethods().post(
        body: {},
        url: source == 0
            ? ApiPostUrl.getBanners
            : ApiPostUrl.getInsidePageBanners);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return bannersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addReaction({required AddReactionRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.addReaction);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<MyItemResponseEntity> getAdvByUser(
      {required GetAdvsByUserRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.itemsByClient);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return myItemResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<CheckLikeResponseEntity> checkLike(
      {required CheckLikeRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.checkLike);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return checkLikeResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> removeLike({required CheckLikeRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.removeLike);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<SearchUserResponseEntity> searchUser(
      {required SearchUserRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.searchUser);

    if (ApiStatusCode.success().contains(response.statusCode)) {
      return searchUserResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<FollowersResponseEntity> getFollowers(
      {required FollowersRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getFollowersByUsername);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return followersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<FollowersResponseEntity> getFollowings(
      {required FollowersRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getFollowingByUsername);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return followersResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetCompanyAccountsResponseEntity> getCompanyAccounts(
      {required GetCompanyAccountRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.businessClientByCategory);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCompanyAccountsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<ItemSearchResponseEntity> itemSearch(
      {required ItemSearchRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.itemsSearch);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return itemSearchResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<AdsByCategoryResponseEntity> getItemsByCategory(
      {required AdsByCategoryRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.categoryItems);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      print(response.body);
      print(response.statusCode);
      return adsByCategoryResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
