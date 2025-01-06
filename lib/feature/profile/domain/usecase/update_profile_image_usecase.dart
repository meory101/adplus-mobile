import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/profile/domain/repository/profile_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Nour Othman(meory)*

class UpdateProfileImageUsecase {
  final ProfileRepository repository;

  UpdateProfileImageUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required File profileImage}) async {
    return await repository.updateProfileImage(profileImage: profileImage);
  }
}
