import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/update_profile_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class ProfileRemote {
  Future<GetProfileInfoResponseEntity> getProfileInfo();
  Future<UpdateProfileResponseEntity> updateProfile({required UpdateProfileRequestEntity entity,});
}
class ProfileRemoteImplement extends ProfileRemote {
  @override
  Future<GetProfileInfoResponseEntity> getProfileInfo() async {
    final response =
    await ApiMethods().get(
        url: ApiGetUrl.getProfileInfo);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getProfileInfoResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<UpdateProfileResponseEntity> updateProfile({required UpdateProfileRequestEntity entity})async {
    final response =
    await ApiMethods().post(
        url: ApiPostUrl.updateProfile);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return updateProfileResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);

}}}