import 'package:mzad_damascus/feature/favorite/domain/entity/response/check_favorite_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/favorites_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

import '../../../domain/entity/request/favorite_request_entity.dart';
import '../../../domain/entity/request/favorites_request_entity.dart';
abstract class FavoriteRemote {
  Future<CheckFavoriteResponseEntity> checkFavorite({
    required FavoriteRequestEntity entity,
  });
  Future<bool> addFavorite({
    required FavoriteRequestEntity entity,
  });
  Future<bool> removeFavorite({
    required FavoriteRequestEntity entity,
  });
  Future<FavoritesResponseEntity> getMyFavorites({
    required MyFavoritesRequestEntity entity,
  });



}

class FavoriteRemoteImplement extends FavoriteRemote {

  @override
  Future<bool> addFavorite({required FavoriteRequestEntity entity})async {
    final response = await ApiMethods().post(url: ApiPostUrl.addToFavorite, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<CheckFavoriteResponseEntity> checkFavorite({required FavoriteRequestEntity entity}) async{
    final response = await ApiMethods().post(url: ApiPostUrl.checkFavorite, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return checkFavoriteResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> removeFavorite({required FavoriteRequestEntity entity}) async{
    final response = await ApiMethods().post(url: ApiPostUrl.removeFavorite, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<FavoritesResponseEntity> getMyFavorites({required MyFavoritesRequestEntity entity})async {
    final response = await ApiMethods().post(url: ApiPostUrl.myFavoriteItems, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return favoritesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }
}
