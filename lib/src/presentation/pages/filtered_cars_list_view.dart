import 'package:flutter/cupertino.dart';

class FilteredCarsView extends StatelessWidget {
  final int id;
  final int start_year;
  final int end_year;
  final String gender;
  final List countries;
  final List colors;

  const FilteredCarsView(
      {Key key,
      this.id,
      this.start_year,
      this.end_year,
      this.gender,
      this.countries,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
