import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/banners_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_categories_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/repository/home_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';
import '../entity/request/add_reaction_request_entity.dart';

/// Eng.Nour Othman(meory)*

class AddReactionUsecase {
  final HomeRepository repository;

  AddReactionUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required AddReactionRequestEntity entity}) async {
    return await repository.addReaction(entity: entity);
  }
}
