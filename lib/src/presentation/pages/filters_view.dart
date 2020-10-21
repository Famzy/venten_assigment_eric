import 'package:assigment/src/data/models/filters_model.dart';
import 'package:assigment/src/presentation/pages/base_view.dart';
import 'package:assigment/src/presentation/scoped_model/filtered_view_model.dart';
import 'package:assigment/src/presentation/widgets/center_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltersView extends StatefulWidget {
  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
      onModelReady: (model) => model.getFilters(),
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text('My Filters'),
        ),
        body: _getBodyUi(context, model),
      ),
    );
  }

  Widget _getBodyUi(BuildContext context, FilterViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return getLoadingUi(context: context);
      case ViewState.NoDataAvailable:
        return noDataUi(context);
      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(FilterViewModel model) {
    return ListView.builder(
        itemCount: model.filters.length,
        itemBuilder: (context, itemIndex) {
          var item = model.filters[itemIndex];
          return _getListItemUi(item, context);
        });
  }

  Widget _getListItemUi(FiltersModel result, BuildContext context) {
    return Padding(
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
                Text(result.start_year.toString()),
                Text(" - "),
                Text(result.end_year.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Gender:"),
                SizedBox(
                  width: 10,
                ),
                Text(result.gender == null ? "All" : result.gender),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(flex: 1, child: Text("Countries:")),
                Expanded(
                  flex: 4,
                  child: Row(
                      children: result.countries
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
                      children: result.colors
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
    );
  }
}
