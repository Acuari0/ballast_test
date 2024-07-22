import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import '../../../domain/entities/models/app_state.dart';
import '../../../domain/entities/models/user.dart';
import '../../../domain/entities/reducers/app_reducer.dart';

class MyStore extends StatefulWidget {
  final Widget child;
  MyStore({Key? key, required this.child}) : super(key: key);
  @override
  _MyStore createState() => new _MyStore();
}

class _MyStore extends State<MyStore> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final initialState =
        AppState(user: User.defaultValues(), loading: false, products: []);

    final store = Store<AppState>(
      appReducer,
      initialState: initialState,
      middleware: [new LoggingMiddleware()],
    );

    return StoreProvider(store: store, child: widget.child);
  }
}
