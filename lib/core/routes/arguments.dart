import 'package:meta/meta.dart';

class Args {
  final int id;
  final int start_year;
  final int end_year;
  final String gender;
  final List<String> countries;
  final List<String> colors;

  Args(
      {@required this.id,
      @required this.start_year,
      @required this.end_year,
      @required this.gender,
      @required this.countries,
      @required this.colors});
}
