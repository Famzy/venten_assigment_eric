import 'package:assigment/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}
