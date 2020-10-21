import 'dart:convert';

import 'package:assigment/core/error/exceptions.dart';
import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/core/utils/app_strings.dart';
import 'package:assigment/src/data/models/car_owners_models.dart';
import 'package:assigment/src/data/models/filters_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class LocalDataSource {
  Future<List<FiltersModel>> getJsonFilters();
  Future<CarOwnersModels> getCarOwnerDetails(Params params);
  Future<void> cachedJsonFilters(FiltersModel filtersToCache);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<FiltersModel>> getJsonFilters() {
    final jsonString =
        sharedPreferences.getString(AppStrings.CACHED_JSON_FILTER);
    if (jsonString != null) {
      //  return Future.value(FiltersModel.formJson(json.decode(jsonString)));
    } else {
      throw CacheException(AppStrings.CACHE_FAILURE_MESSAGE);
    }
  }

  @override
  Future<void> cachedJsonFilters(FiltersModel filtersToCache) {
    return sharedPreferences.setString(
      AppStrings.CACHED_JSON_FILTER,
      json.encode(filtersToCache.toJson()),
    );
  }

  @override
  Future<CarOwnersModels> getCarOwnerDetails(Params params) {
    // TODO: implement getCarOwnerDetails
    throw UnimplementedError();
  }
}
