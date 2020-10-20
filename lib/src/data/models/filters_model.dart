import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:meta/meta.dart';

class FiltersModel extends FiltersEntities {
  FiltersModel({
    @required id,
    @required start_year,
    @required end_year,
    @required gender,
    @required countries,
    @required colors,
  }) : super(
            id: id,
            start_year: start_year,
            end_year: end_year,
            gender: gender,
            countries: countries,
            colors: colors);

  factory FiltersModel.formJson(Map<String, dynamic> json) {
    return FiltersModel(
        id: json['id'],
        start_year: json[' start_year'],
        end_year: json[' end_year'],
        gender: json['gender'],
        countries: json['countries'],
        colors: json['colors']);
  }
}
