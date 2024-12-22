import 'package:dartz/dartz.dart';

import 'package:flutter_skill_test/core/error/failure.dart';
import 'package:flutter_skill_test/core/usecases/usecase.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:flutter_skill_test/features/home/domain/repositories/home_repository.dart';

class FetchAllHousesUsecase extends UseCase<List<House>, NoParams> {
  final HomeRepository repository;
  FetchAllHousesUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<House>>> call(NoParams params) {
    return repository.fetchAllHouses();
  }
}
