import 'package:dartz/dartz.dart';
import 'package:flutter_skill_test/core/error/failure.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<House>>> fetchAllHouses();
}