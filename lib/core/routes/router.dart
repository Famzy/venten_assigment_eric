import 'package:assigment/core/routes/arguments.dart';
import 'package:assigment/src/presentation/pages/filtered_cars_list_view.dart';
import 'package:assigment/src/presentation/pages/filters_view.dart';
import 'package:flutter/material.dart';

class Router {
  static GlobalKey<NavigatorState> get navigatorKey =>
      GlobalKey<NavigatorState>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static const filters = '/';
  static const ownersDetails = '/ownersDetails';

  PageRoute _getPageRoute(
      {String routeName, Widget viewToShow, dynamic arguments}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => viewToShow);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final Args args = settings.arguments;

    switch (settings.name) {
      case filters:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: FiltersView(),
        );
      case ownersDetails:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: FilteredCarsView(
            end_year: args.end_year,
            start_year: args.start_year,
            colors: args.colors,
            countries: args.countries,
            gender: args.gender,
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                    'No route defined for ${settings.name}',
                    style: TextStyle(color: Colors.black),
                  )),
                ));
    }
  }
}
