import 'package:dartz/dartz.dart';
import 'package:flutter_skill_test/core/error/exception.dart';
import 'package:flutter_skill_test/core/error/failure.dart';
import 'package:flutter_skill_test/core/platform/network_info.dart';
import 'package:flutter_skill_test/features/home/data/datasources/home_fake_remote_datasource.dart';
import 'package:flutter_skill_test/features/home/domain/entities/house.dart';
import 'package:flutter_skill_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeFakeRemoteDatasource datasource;
  final NetworkInfo networkInfo;
  HomeRepositoryImpl({required this.datasource, required this.networkInfo});

  @override
  Future<Either<Failure, List<House>>> fetchAllHouses() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await datasource.fetchAllHouse();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      //Load cache data is not Implemented
      return Left(ServerFailure());
    }
  }
}
