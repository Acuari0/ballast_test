import 'package:redux/redux.dart';
import '../actions/loading_action.dart';


final loadingReducer = TypedReducer<bool, SetLoading>(_setLoading);

bool _setLoading(bool state, SetLoading action) {
  return action.loading;
}
