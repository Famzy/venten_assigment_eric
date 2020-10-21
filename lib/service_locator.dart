import 'package:assigment/src/data/datasource/local/local_data_source.dart';
import 'package:assigment/src/data/datasource/remote/remote_data_source.dart';
import 'package:assigment/src/data/repository/repository_impl.dart';
import 'package:assigment/src/domain/repository/repository.dart';
import 'package:assigment/src/domain/usecase/car_owners_usecase.dart';
import 'package:assigment/src/domain/usecase/filters_usecase.dart';
import 'package:assigment/src/presentation/scoped_model/filtered_view_model.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' show Client;
import 'core/network/network_info.dart';

Client client = Client();
GetIt di = GetIt();
Future<void> dependencyInjections() async {
  // Data sources
  di.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(client: di()),
  );
  di.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(sharedPreferences: di()),
  );
  //! Core Stuffs
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));

  //! External Dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  di.registerLazySingleton(() => client);
  di.registerLazySingleton(() => DataConnectionChecker());

  // Repository
  di.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      localDataSource: di(),
      networkInfo: di(),
      remoteDataSource: di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(() => FiltersUC(di()));
  di.registerLazySingleton(() => CarOwnersUC(di()));

  di.registerFactory(
    () => FilterViewModel(
      filters: di(),
      owenersDetails: di(),
    ),
  );
}
