import 'package:equatable/equatable.dart';

class CarOwnersEntity extends Equatable {
  final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String country;
  final String car_model;
  final int car_model_year;
  final String car_color;
  final String gender;
  final String job_title;
  final String bio;

  CarOwnersEntity(
      {this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.country,
      this.car_model,
      this.car_model_year,
      this.car_color,
      this.gender,
      this.job_title,
      this.bio})
      : super([
          id,
          first_name,
          last_name,
          email,
          country,
          car_model,
          car_model_year,
          car_color,
          gender,
          job_title,
          bio
        ]);
}
