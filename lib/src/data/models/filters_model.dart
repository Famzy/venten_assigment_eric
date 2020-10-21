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
    var colorsFromJson = json['colors'];
    var countriesFromJson = json['countries'];
//    List<String> colorsList = colorsFromJson.cast<dynamic>();
    List<String> colorsList = new List<String>.from(colorsFromJson);
    List<String> countriesList = new List<String>.from(countriesFromJson);

    //List<String> countriesList = countriesFromJson.cast<dynamic>();

    return FiltersModel(
      id: json['id'],
      start_year: json['start_year'],
      end_year: json['end_year'],
      gender: (json['gender']),
      countries: countriesList,
      colors: colorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'start_year': start_year,
      'end_year': end_year,
      "gender": gender,
      'countries': countries,
      'colors': colors
    };
  }
}
