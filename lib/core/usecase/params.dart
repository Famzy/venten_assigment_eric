import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int id;
  final int start_year;
  final int end_year;
  final String gender;
  final List countries;
  final List colors;

  Params(
      {this.id,
      this.start_year,
      this.end_year,
      this.gender,
      this.countries,
      this.colors})
      : super([id, start_year, end_year, gender, countries, colors]);
}

class NoParams extends Equatable {}
