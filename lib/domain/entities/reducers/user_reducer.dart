import 'package:redux/redux.dart';
import '../actions/user_action.dart';
import '../models/user.dart';

final userReducer = TypedReducer<User, SetUser>(_setUserReducer);

User _setUserReducer(User state, SetUser action) {
  return action.user;
}
