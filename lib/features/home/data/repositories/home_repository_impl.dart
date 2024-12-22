import 'package:dartz/dartz.dart';
import 'package:flutter_skill_test/core/error/exception.dart';
import 'package:flutter_skill_test/core/error/failure.dart';
import 'package:flutter_skill_test/features/home/data/datasources/home_fake_remote_datasource.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:flutter_skill_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeFakeRemoteDatasource datasource;
  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<House>>> fetchAllHouses() async {
    try {
      final result = await datasource.fetchAllHouse();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
