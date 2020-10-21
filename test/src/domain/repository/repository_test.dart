import 'package:assigment/core/usecase/params.dart';
import 'package:assigment/src/domain/entities/car_owners_entities.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:assigment/src/domain/repository/repository.dart';
import 'package:assigment/src/domain/usecase/car_owners_usecase.dart';
import 'package:assigment/src/domain/usecase/filters_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  FiltersUC filterUC;
  CarOwnersUC carOwnersUC;
  MockRepository mockRepository;
  setUp(() {
    mockRepository = MockRepository();
    filterUC = FiltersUC(mockRepository);
  });
  final tFilter = FiltersEntities(
      id: 1,
      start_year: 2007,
      end_year: 2009,
      gender: "male",
      countries: ["Brazil", "Ireland", "Egypt", "Peru"],
      colors: ["Green", "Violet", "Yellow", "Blue"]);

  test("Get list of Json Filters", () async {
    when(mockRepository.getFilters())
        .thenAnswer((realInvocation) async => Right(tFilter));
    //act
    final result = await filterUC.call(null);
    //assert
    expect(result, Right(tFilter));
    verify(mockRepository.getFilters());
    verifyNoMoreInteractions(mockRepository);
  });

  final tDetails = CarOwnersEntity(
      id: 1,
      email: "xyz@test.com",
      first_name: "John",
      last_name: "Doe",
      car_color: "Red",
      car_model: "Benz",
      car_model_year: 2000,
      country: "Peru",
      gender: "male",
      job_title: "Trader",
      bio: "sells Food");

  test("Get the Filtered Cars Details", () async {
    when(mockRepository.getOwnersDetails(Params(
            id: 1,
            end_year: 2,
            start_year: 2,
            colors: ['red'],
            countries: ['gers'])))
        .thenAnswer((realInvocation) async => Right(tDetails));
    final result = await carOwnersUC.call(any);
    expect(result, Right(tFilter));
    verify(mockRepository.getOwnersDetails(Params(
        id: 1,
        end_year: 2,
        start_year: 2,
        colors: ['red'],
        countries: ['gers'])));
    verifyNoMoreInteractions(mockRepository);
  });
}
