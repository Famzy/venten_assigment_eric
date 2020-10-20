import 'dart:convert';
import 'dart:io';

import 'package:assigment/core/error/exceptions.dart';
import 'package:assigment/core/error/failures.dart';
import 'package:assigment/core/utils/app_strings.dart';
import 'package:assigment/src/data/models/filters_model.dart';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';

abstract class RemoteDataSource {
  /// Calls the https://ven10.co/assessment/filter.json endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FiltersModel> getJsonFilters();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  Client client = Client();

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<FiltersModel> getJsonFilters() async {
    try {
      final response =
          await client.get("https://ven10.co/assessment/filter.json", headers: {
        'Content-Type': 'application/json',
      });

      switch (response.statusCode) {
        case HttpStatus.ok:
          return FiltersModel.formJson(json.decode(response.body));
        default:
          throw ServerFailure();
      }
    } catch (e) {
      throw ServerException(AppStrings.SERVER_FAILURE_MESSAGE);
    }
  }
}
