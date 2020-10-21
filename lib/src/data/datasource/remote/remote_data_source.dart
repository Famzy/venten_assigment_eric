import 'dart:convert';
import 'dart:io';

import 'package:assigment/core/error/exceptions.dart';
import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/utils/app_strings.dart';
import 'package:assigment/src/data/models/filters_model.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';

abstract class RemoteDataSource {
  /// Calls the https://ven10.co/assessment/filter.json endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<FiltersEntities>> getJsonFilters();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  Client client = Client();

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<List<FiltersEntities>> getJsonFilters() async {
    try {
      final response =
          await client.get("https://ven10.co/assessment/filter.json", headers: {
        'Content-Type': 'application/json',
      });
      print(response.statusCode);
      Iterable data = json.decode(response.body);
      switch (response.statusCode) {
        case HttpStatus.ok:
          return data.map((model) => FiltersModel.formJson(model)).toList();
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
      throw ServerException(AppStrings.SERVER_FAILURE_MESSAGE);
    }
  }
}
