import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_under_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/edit_password_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/myitems_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/update_profile_username_response_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/response/verfiy_username_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
  import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
 import '../../../../core/api/api_error/api_failures.dart';
 
/// Eng.Nour Othman(meory)*

abstract class MoreRepository {
  
  Future<Either<ApiFailure,UpdateUsernameResponseEntity>> updateUsername({required UpdateUsernameRequestEntity entity}) ;
    Future<Either<ApiFailure,VerifyUsernameResponseEntity>> verfiyusername({required VerifyUsernameRequestEntity entity}) ;
        Future<Either<ApiFailure,EditPasswordResponseEntity>> editpassword({required EditPasswordRequestEntity entity}) ;
                Future<Either<ApiFailure,MyItemResponseEntity>> myitem({required MyItemRequestEntity entity}) ;
                                Future<Either<ApiFailure,MyItemResponseEntity>> myitemunderreview({required MyItemUnderReviewRequestEntity entity}) ;




}
