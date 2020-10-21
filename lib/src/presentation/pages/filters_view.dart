import 'package:assigment/core/routes/router.dart';
import 'package:assigment/core/routes/router.gr.dart';
import 'package:assigment/src/data/models/filters_model.dart';
import 'package:assigment/src/presentation/pages/base_view.dart';
import 'package:assigment/src/presentation/scoped_model/filtered_view_model.dart';
import 'package:assigment/src/presentation/widgets/center_message.dart';
import 'package:assigment/src/presentation/widgets/list_items.dart';
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
    return ListItems(
        onTap: () => Routes.navigator.pushNamed(Routes.ownersDetails),
        start_year: result.start_year.toString(),
        end_year: result.end_year.toString(),
        gender: result.gender,
        colors: result.colors,
        countries: result.countries);
  }
}
