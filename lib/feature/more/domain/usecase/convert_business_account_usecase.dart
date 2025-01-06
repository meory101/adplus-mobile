import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mzad_damascus/feature/more/domain/repository/more_repository.dart';
import '../../../../core/api/api_error/api_failures.dart';

/// Eng.Hussaen  Baghdadi

class ConvertBusinessAccountUsecase {
  final MoreRepository repository;

  ConvertBusinessAccountUsecase({
    required this.repository,
  });

  Future<Either<ApiFailure, bool>> call({required File? file}) async {
    return await repository.convertToBusinessAccount(file: file);
  }
}
