import 'package:assigment/core/error/exceptions.dart';
import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/network/network_info.dart';
import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/src/data/datasource/local/local_data_source.dart';
import 'package:assigment/src/data/datasource/remote/remote_data_source.dart';
import 'package:assigment/src/domain/entities/car_owners_entities.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:assigment/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;

  RepositoryImpl(
      {this.remoteDataSource, this.networkInfo, this.localDataSource});

  @override
  Future<Either<Failure, FiltersEntities>> getFilters() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFilters = await remoteDataSource.getJsonFilters();
        localDataSource.cachedJsonFilters(remoteFilters);
        return Right(remoteFilters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFilters = await localDataSource.getJsonFilters();
        return Right(localFilters);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CarOwnersEntity>> getOwnersDetails(Params filter) {
    // TODO: implement getOwnersDetails
    throw UnimplementedError();
  }
}
