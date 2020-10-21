//i
import 'package:assigment/src/presentation/pages/filtered_cars_list_view.dart';
import 'package:assigment/src/presentation/pages/filters_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@autoRouter
class $Routes {
  @initial
  FiltersView filters;
  FilteredCarsView ownersDetails;
}
