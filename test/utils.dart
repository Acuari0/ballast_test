import 'package:ballast_test/domain/entities/models/app_state.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/domain/entities/reducers/app_reducer.dart';
import 'package:ballast_test/ui/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'dart:ui' as ui;

Widget createStoreWrapper({Widget? child, AppState? state}) {
  final initialState = AppState(
      user: User.defaultValues(),
      products: [],
      loading: false,
  );

  final store = Store<AppState>(
    appReducer,
    initialState: state != null ? state : initialState,
    middleware: [new LoggingMiddleware.printer()],
  );

  return StoreProvider(
      store: store, child: child != null ? child : Container());
}

Widget createElementTestWrapper({Widget? child}) => MediaQuery(
    data: MediaQueryData.fromWindow(ui.window),
    child: Directionality(textDirection: TextDirection.rtl, child: child!));

Widget createWrapper({Widget? child, AppState? state}) => createStoreWrapper(
    child: createLocalizationsWrapper(child: child), state: state);

Widget createLocalizationsWrapper({Widget? child}) => MaterialApp(
  theme: appTheme,
  title: "Ballast_test",
  home: Scaffold(key: Key('test'), body: child),
);