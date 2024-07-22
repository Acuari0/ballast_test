import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/ui/page/login_page/login.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../domain/entities/models/app_state.dart';
import '../../../domain/entities/models/user.dart';
import '../home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  final FlutterSecureStorage? storage;
  final SimpleLogin? authenticationService;
  LoginPage({Key? key, this.storage, this.authenticationService})
      : super(key: key);
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _token = '';

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        onInit: (Store<AppState> store) async {
          if (await widget.authenticationService!.checkLogin()) {
            setState(() {
              store.state.user.doAdmin();
              _token = store.state.user.token!;
            });
          }
        },
        onDidChange: (_ViewModel? previousVM, _ViewModel vm) async {
          if (await widget.authenticationService!.checkLogin()) {
            setState(() {
              vm.user!.doAdmin();
              _token = "token";
            });
          } else {
            setState(() {
              _token = "";
            });
          }
        },
        converter: (Store<AppState> store) => (_ViewModel.fromStore(store)),
        builder: (BuildContext context, _ViewModel vm) {
          if (_token.isNotEmpty) vm.user!.doAdmin();
          return Scaffold(
              key: _scaffoldKey,
              body: (_token != '')
                  ? HomePage(authentication: widget.authenticationService)
                  : Login(
                      simpleLogin: widget.authenticationService,
                    ));
        });
  }
}

class _ViewModel {
  final User? user;
  final dynamic dispatch;

  _ViewModel({
    required this.user,
    required this.dispatch,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      user: store.state.user,
      dispatch: store.dispatch,
    );
  }
}
