import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/core/usecase/usecase.dart';
import 'package:assigment/src/domain/entities/car_owners_entities.dart';
import 'package:assigment/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class CarOwnersUC implements UseCase<CarOwnersEntity, Params> {
  final Repository repository;

  CarOwnersUC(this.repository);
  @override
  Future<Either<Failure, CarOwnersEntity>> call(Params params) async =>
      await repository.getOwnersDetails(params);
}
