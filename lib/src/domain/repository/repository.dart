import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/src/domain/entities/car_owners_entities.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<FiltersEntities>>> getFilters();
  Future<Either<Failure, List<CarOwnersEntity>>> getOwnersDetails(
      Params filter);
}
