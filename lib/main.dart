import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/firebase_options.dart';
import 'package:ballast_test/ui/constants/theme.dart';
import 'package:ballast_test/ui/page/on_board/on_board.dart';
import 'package:ballast_test/ui/widgets/store/my_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'domain/entities/models/app_state.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyStore(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final appTitle = 'Ballast_test';
  @override
  Widget build(BuildContext context) {
    Widget body(_ViewModel vm) {
      return GestureDetector(
          key: Key('main'),
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(builder: (context, widget) {
            return LoadingOverlay(
                isLoading: vm.loading,
                color: Colors.black,
                progressIndicator: SizedBox(
                  child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          appTheme.primaryColor)),
                  height: 100.0,
                  width: 100.0,
                ),
                child: MaterialApp(
                    theme: appTheme,
                    title: appTitle,
                    home:
                    FlutterSplashScreen.gif(
                      key: Key('splash'),
                      backgroundColor: Colors.white,
                        duration: const Duration(milliseconds: 3000),
                      setStateTimer:  Duration(milliseconds: 1000),
                        gifPath: 'assets/pokemon-pokeball.gif',
                        gifWidth: 269,
                        gifHeight: 474,

                      nextScreen: LoginPage(storage: FlutterSecureStorage(),
                        authenticationService: SimpleLogin(),)),
                    ));
          }));
    }

    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel vm) {
          return body(vm);
        });
  }
}

class _ViewModel {
  final dynamic dispatch;
  final bool loading;

  _ViewModel({required this.dispatch, required this.loading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(dispatch: store.dispatch, loading: store.state.loading,);
  }
}

