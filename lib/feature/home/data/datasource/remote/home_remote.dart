
import 'dart:convert';

import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';

import '../../../../../core/api/api_error/api_exception.dart';
import '../../../../../core/api/api_error/api_status_code.dart';
import '../../../../../core/api/api_links.dart';
import '../../../../../core/api/api_methods.dart';

abstract class HomeRemote {
  Future<GetCategoriesResponseEntity> getCategories();


}

class HomeRemoteImplement extends HomeRemote {
  @override
  Future<GetCategoriesResponseEntity> getCategories() async {
    final response =
    await ApiMethods().get(
        url: ApiGetUrl.getCategories);

    print(jsonDecode(response.body));
    print(response.statusCode);
    print("-----------------------");
    if (ApiStatusCode.success().contains(response.statusCode)) {
      return getCategoriesResponseEntityFromJson(response.body);
    } else {
      throw ApiServerException(response: response);
    }
  }


}