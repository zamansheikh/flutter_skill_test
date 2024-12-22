import 'package:dartz/dartz.dart';
import 'package:flutter_skill_test/core/error/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}