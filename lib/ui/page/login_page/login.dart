import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/domain/entities/models/user.dart';
import 'package:ballast_test/ui/common/utils.dart';
import 'package:ballast_test/ui/constants/styles/box_styles.dart';
import 'package:ballast_test/ui/widgets/pokemon_dancing/pokemon_dancing.dart';
import 'package:flutter/cupertino.dart';
import 'package:ballast_test/ui/constants/constants.dart' as Constants;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../../domain/entities/models/app_state.dart';


class Login extends StatefulWidget{
  final SimpleLogin? simpleLogin;
  Login({this.simpleLogin});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email;
  String? _password;
  GlobalKey<FormState> _keyForm = GlobalKey();
  RegExp emailRegExp = new RegExp(Constants.EMAIL_REG_EXP);
  bool _obscureText=true;
  ScrollController? scrollController = ScrollController();
  ScrollPhysics physics = ScrollPhysics();
  bool isListScrollable = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
      isListScrollable = scrollController!.positions.isNotEmpty &&
          physics.shouldAcceptUserOffset(scrollController!.position);
    }));
    SimpleLogin authenticationService =
        widget.simpleLogin ?? SimpleLogin();

    return LayoutBuilder(builder: (context, constraints) {
      scrollController = ScrollController();
      physics = ScrollPhysics();
      return StoreConnector(
          converter: (Store<AppState> store) => store.dispatch,
          builder: (BuildContext context, dynamic dispatch) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ListView(
                      controller: scrollController,
                      physics: physics,
                      shrinkWrap: true,
                      children: [
                        Column(
                          key: Key('login'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 300.0,
                              child: Form(
                                key: _keyForm,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 30,),
                                    Image.asset('assets/pok.png'),
                                    Text("Movies",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800
                                    ),),
                                    SizedBox(height: 30,),
                                    Container(
                                      margin:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                      child: TextFormField(
                                        key:Key('username'),
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        maxLength: 50,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            labelText: 'User',
                                            hintText: "User",
                                            counterText: '',
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always),
                                        onSaved: (text) => _email = text,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                      child: TextFormField(
                                        key:Key('password'),
                                        keyboardType: TextInputType.text,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            hintText: "Password",
                                            labelText: "Password",
                                            counterText: '',
                                            suffixIcon: IconButton(
                                              key: Key('visibility_button'),
                                              onPressed: _toggle,
                                              icon: Icon(_obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                            ),
                                            floatingLabelBehavior:
                                            FloatingLabelBehavior.always),
                                        obscureText: _obscureText,
                                        onSaved: (text) => _password = text,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: ButtonTheme(
                                        minWidth: 300.0,
                                        height: 40.0,
                                        child: ElevatedButton(
                                          key: Key('login_button'),
                                          onPressed: () async {
                                            if (_keyForm.currentState!
                                                .validate()) {
                                              _keyForm.currentState!.save();
                                              User? authetication =
                                              await authenticationService.login(
                                                  username: _email!,
                                                  password: _password!,
                                                  dispatch: dispatch);
                                              if (authetication == null) {
                                                showErrorrDialog(context);
                                              }
                                            }
                                          },
                                          child: Text(
                                              "Sign in",
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 60,),
                            PokemonDancing()
                          ],
                        ),
                      ]),
                ),
              ],
            );
          });
    });
  }
}