import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_reaction_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/category_inside_page_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/category_inside_page_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../../../more/domain/entity/response/myitems_response_entity.dart';
import '../entity/request/add_comment_request_entity.dart';
import '../entity/request/advs_by_attribute_request_entity.dart';
import '../entity/request/check_like_request_entity.dart';
import '../entity/request/followers_request_entity.dart';
import '../entity/request/get_adv_details_request_entity.dart';
import '../entity/request/get_advs_by_user_request_entity.dart';
import '../entity/request/get_comments_request_entity.dart';
import '../entity/request/search_user_request_entity.dart';
import '../entity/response/advs_by_attribute_response_entity.dart';
import '../entity/response/banners_response_entity.dart';
import '../entity/response/check_like_response_entity.dart';
import '../entity/response/followers_response_entity.dart';
import '../entity/response/get_adv_details_response_entity.dart';
import '../entity/response/get_comments_response_entity.dart';
import '../entity/response/search_user_response_entity.dart';

/// Eng.Nour Othman(meory)*

abstract class HomeRepository {
  Future<Either<ApiFailure,SearchUserResponseEntity>> searchUser({required SearchUserRequestEntity entity});
    Future<Either<ApiFailure, GetCategoriesResponseEntity>> getCategories();
  Future<Either<ApiFailure,bool>> removeLike({required CheckLikeRequestEntity entity});
  Future<Either<ApiFailure, CheckLikeResponseEntity>> checkLike({required CheckLikeRequestEntity entity});
  Future<Either<ApiFailure, BannersResponseEntity>> getBanners({required int source});
  Future<Either<ApiFailure, CategoryInsidePageResponseEntity>> getCategoryInsidePage({required CategoryInsidePageRequestEntity entity});
  Future<Either<ApiFailure,AdvsByAttributeResponseEntity>> getAdvsByAttribute({required AdvsByAttributeRequestEntity entity});
  Future<Either<ApiFailure, GetAdvDetailsResponseEntity>>getAdvDetails({required GetAdvDetailsRequestEntity entity});
  Future<Either<ApiFailure, bool>> addComment({required AddCommentRequestEntity entity});
  Future<Either<ApiFailure, bool>> addReaction({required AddReactionRequestEntity entity});
  Future<Either< ApiFailure,GetCommentsResponseEntity>> getComments({required GetCommentsRequestEntity entity});
  Future<Either< ApiFailure,MyItemResponseEntity>> getAdvByUser({required GetAdvsByUserRequestEntity entity});
  Future<Either< ApiFailure,FollowersResponseEntity>> getFollowings({required FollowersRequestEntity entity}) ;
  Future<Either< ApiFailure,FollowersResponseEntity>> getFollowers({required FollowersRequestEntity entity});


  }
