import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../domain/entity/comments_request_entity.dart';

abstract class CommentRemote {
  Future<CommentsResponseEntity> getMyComments({required CommentsRequestEntity entity});


}

class CommentRemoteImplement extends CommentRemote {
  @override
  Future<CommentsResponseEntity> getMyComments({required CommentsRequestEntity entity})async {
    final response = await ApiMethods().post(url: ApiPostUrl.getMyCommentsWithItems, body:{});
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return commentsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}
