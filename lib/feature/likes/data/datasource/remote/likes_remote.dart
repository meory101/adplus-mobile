import 'package:mzad_damascus/feature/favorite/domain/entity/response/check_favorite_response_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/response/favorites_response_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class LikesRemote {
  Future<LikesResponseEntity> getItemsHasReactions({
    required LikesRequestEntity entity,
  });


}

class FavoriteRemoteImplement extends LikesRemote {
  @override
  Future<LikesResponseEntity> getItemsHasReactions({required LikesRequestEntity entity})async {
    final response = await ApiMethods().post(url: ApiPostUrl.getItemsHasReactions, body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return likesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}
