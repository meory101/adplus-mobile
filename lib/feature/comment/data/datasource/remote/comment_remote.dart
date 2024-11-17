import 'package:mzad_damascus/feature/comment/domain/entity/response/comments_response_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/request/likes_request_entity.dart';
import 'package:mzad_damascus/feature/likes/domain/entity/response/likes_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class CommentRemote {
  Future<CommentsResponseEntity> getMyComments();


}

class CommentRemoteImplement extends CommentRemote {
  @override
  Future<CommentsResponseEntity> getMyComments()async {
    final response = await ApiMethods().post(url: ApiPostUrl.getMyCommentsWithItems, body:{});
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return commentsResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}
