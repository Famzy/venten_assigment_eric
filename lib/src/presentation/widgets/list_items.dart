import 'package:flutter/material.dart';

Widget ListItems(
    {String start_year,
    String end_year,
    String gender,
    List countries,
    List colors,
    Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Date Range:"),
                SizedBox(
                  width: 10,
                ),
                Text(start_year),
                Text(" - "),
                Text(end_year),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Gender:"),
                SizedBox(
                  width: 10,
                ),
                Text(gender),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(flex: 1, child: Text("Countries:")),
                Expanded(
                  flex: 4,
                  child: Row(
                      children: countries
                          .map((item) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: new Text(item)))
                          .toList()),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(flex: 1, child: Text("Colors:")),
                Expanded(
                  flex: 4,
                  child: Row(
                      children: colors
                          .map((item) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1),
                              child: new Text(item)))
                          .toList()),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
