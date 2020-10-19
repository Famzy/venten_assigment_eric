import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/core/usecase/usecase.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:assigment/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class FiltersUC implements UseCase<FiltersEntities, NoParams> {
  final Repository repository;

  FiltersUC({this.repository});
  @override
  Future<Either<Failure, FiltersEntities>> call(NoParams none) async => await repository.getFilters();
}
