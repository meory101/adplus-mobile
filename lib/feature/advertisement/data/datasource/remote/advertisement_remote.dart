import 'dart:io';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_cities_response_entity.dart';
import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/storage/shared/shared_pref.dart';
import '../../../domain/entity/request/add_advertisement_request_entity.dart';
import '../../../domain/entity/request/get_category_attributes_request_entity.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
abstract class AdvertisementRemote {
  Future<GetCategoryAttributesResponseEntity> getCategoryAttributes({
    required GetCategoryAttributesRequestEntity entity,
  });

  Future<GetCitiesResponseEntity> getCities();

  Future<bool> addAdvertisement(
      {required AddAdvertisementRequestEntity entity,
      required List<File> files});

  Future<bool> updateAdvertisement(
      {required AddAdvertisementRequestEntity entity,
        required List<File> files});

  Future<bool> deleteAdvertisement(
      {required DeleteAdvRequestEntity entity,});
}

class AdvertisementRemoteImplement extends AdvertisementRemote {
  @override
  Future<GetCategoryAttributesResponseEntity> getCategoryAttributes(
      {required GetCategoryAttributesRequestEntity entity}) async {
    final response = await ApiMethods()
        .post(body: entity.toJson(), url: ApiPostUrl.getCategoryAttributes);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCategoryAttributesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<GetCitiesResponseEntity> getCities() async {
    final response = await ApiMethods().get(url: ApiGetUrl.getCities);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCitiesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }

  @override
  Future<bool> addAdvertisement(
      {required AddAdvertisementRequestEntity entity,
      required List<File> files}) async {
    Map data = entity.toJson();
    var multiPartRequest = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://${AppConstantManager.baseUrl}/${ApiPostUrl.addAdv}'));

    for (var image in files) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'photos[]',
        stream,
        length,
        filename: basename(image.path),
      );
      multiPartRequest.files.add(multipartFile);
    }

    multiPartRequest.headers.addAll({
      'Authorization': 'Bearer ${AppSharedPreferences.getToken()}',
    });

    data.forEach((key, value) {
      multiPartRequest.fields[key.toString()] = value.toString();
    });

    if (data['attributes'] != null && data['attributes'] is List) {
      for (var attr in data['attributes']) {
        multiPartRequest
                .fields['attributes[${attr.attributeId}][attribute_id]'] =
            attr.attributeId.toString();
        multiPartRequest.fields['attributes[${attr.attributeId}][value]'] =
            attr.value.toString();
      }
    }
    http.StreamedResponse response = await multiPartRequest.send();
    final finalResponse =await http.Response.fromStream(response);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: finalResponse);
    }
  }

  @override
  Future<bool> updateAdvertisement({required AddAdvertisementRequestEntity entity, required List<File> files}) async{
    Map data = entity.toJson();
    var multiPartRequest = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://${AppConstantManager.baseUrl}/${ApiPostUrl.updateAdv}'));

    for (var image in files) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'photos[]',
        stream,
        length,
        filename: basename(image.path),
      );
      multiPartRequest.files.add(multipartFile);
    }

    multiPartRequest.headers.addAll({
      'Authorization': 'Bearer ${AppSharedPreferences.getToken()}',
    });

    data.forEach((key, value) {
      multiPartRequest.fields[key.toString()] = value.toString();
    });

    if (data['attributes'] != null && data['attributes'] is List) {
      for (var attr in data['attributes']) {
        multiPartRequest
            .fields['attributes[${attr.attributeId}][attribute_id]'] =
            attr.attributeId.toString();
        multiPartRequest.fields['attributes[${attr.attributeId}][value]'] =
            attr.value.toString();
      }
    }
    http.StreamedResponse response = await multiPartRequest.send();
    final finalResponse =await http.Response.fromStream(response);
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: finalResponse);
    }
  }

  @override
  Future<bool> deleteAdvertisement({required DeleteAdvRequestEntity entity})async {
    print(entity.itemId);
    print('dddddddddddd');
    final response = await ApiMethods().post(url: ApiPostUrl.deleteAdv,body: entity.toJson());
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return true;
    } else {
      throw ApiServerException(response: response);
    }
  }
}
