import 'package:assigment/src/data/models/filters_model.dart';
import 'package:assigment/src/domain/entities/filters_entities.dart';
import 'package:assigment/src/domain/usecase/car_owners_usecase.dart';
import 'package:assigment/src/domain/usecase/filters_usecase.dart';
import 'package:assigment/src/presentation/scoped_model/base_view_model.dart';
import 'package:meta/meta.dart';

export 'package:assigment/core/emums/view_state.dart';

class FilterViewModel extends BaseModel {
  final FiltersUC filtersUC;
  final CarOwnersUC carOwnersUC;
  var data;
  List<FiltersModel> filters = List<FiltersModel>();
  FilterViewModel(
      {@required FiltersUC filters, @required CarOwnersUC owenersDetails})
      : assert(filters != null),
        assert(owenersDetails != null),
        carOwnersUC = owenersDetails,
        filtersUC = filters;

  getFilters() async {
    final res = await filtersUC.call(null);
    res.fold((l) => setState(ViewState.Error),
        (filter) => {setState(ViewState.Success), filters = filter});
  }
}
