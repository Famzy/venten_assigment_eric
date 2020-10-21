import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class FilteredCarsView extends StatelessWidget {
  final int id;
  final int start_year;
  final int end_year;
  final String gender;
  final List countries;
  final List colors;

  const FilteredCarsView(
      {Key key,
      @required this.id,
      @required this.start_year,
      @required this.end_year,
      @required this.gender,
      @required this.countries,
      @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
