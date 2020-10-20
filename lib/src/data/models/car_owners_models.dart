import 'package:assigment/src/domain/entities/car_owners_entities.dart';
import 'package:meta/meta.dart';

class CarOwnersModels extends CarOwnersEntity {
  CarOwnersModels(
      {@required id,
      @required first_name,
      @required last_name,
      @required email,
      @required country,
      @required car_model,
      @required car_model_year,
      @required car_color,
      @required gender,
      @required job_title,
      @required bio})
      : super(
          id: id,
          first_name: first_name,
          last_name: last_name,
          email: email,
          country: country,
          car_model: car_model,
          car_model_year: car_model_year,
          car_color: car_color,
          gender: gender,
          job_title: job_title,
          bio: bio,
        );

  factory CarOwnersModels.formJson(Map<String, dynamic> json) {
    return CarOwnersModels(
        id: json['id'],
        first_name: json[' first_name'],
        last_name: json[' last_name'],
        email: json['email'],
        country: json['country'],
        car_model: json['car_model'],
        car_model_year: json['car_model_year'],
        car_color: json['car_color'],
        gender: json['gender'],
        job_title: json['job_title'],
        bio: json['bio']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      "email": email,
      'country': country,
      'car_model': car_model,
      'car_model_year': car_model_year,
      'car_color': car_color,
      'gender': gender,
      'job_title': job_title,
      'bio': bio
    };
  }
}
