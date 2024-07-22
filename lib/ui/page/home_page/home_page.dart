import 'package:ballast_test/data/repositories/simple_login.dart';
import 'package:ballast_test/data/service/search.dart';
import 'package:ballast_test/ui/common/utils.dart';
import 'package:ballast_test/ui/page/home_page/widgets/card_tile.dart';

import 'package:ballast_test/ui/widgets/CustomFlatButton/CustomFlatButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../data/service/delegate.dart';
import '../../../domain/entities/models/app_state.dart';
import '../../../domain/entities/models/products.dart';
import '../../../domain/entities/models/user.dart';

class HomePage extends StatefulWidget{
  final SimpleLogin? authentication;
  HomePage({this.authentication});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Delegate _delegate=Delegate();
  Search _search=Search();
  List<Product> _product=[],_searchProducts=[];
  @override
  Widget build(BuildContext context) {
    SimpleLogin authenticationService =
        widget.authentication ?? SimpleLogin();
    return StoreConnector(
        onInit: (Store<AppState> store) async {
          store.state.products.addAll(await obtainElements(_delegate, _product, store.dispatch));
          setState(() {
            _searchProducts=_product;
          });
        },
        onDidChange: (_ViewModel? previousVM, _ViewModel vm) {

        },
        converter: (Store<AppState> store) => (_ViewModel.fromStore(store)),
        builder: (BuildContext context, _ViewModel vm) {
          vm.products.clear();
          vm.products.addAll(_product);

          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              title: Text("Movies"),
              leading:
              IconButton(
                key: Key('refresh'),
                  onPressed: (){
                obtainElements(_delegate, _product, vm.dispatch).then((value) {
                  setState(() {
                    vm.products.clear();
                    vm.products.addAll(_product);
                    _searchProducts=_product;
                  });
                });
              }, icon:Icon(Icons.refresh)),
              actions: [
                CustomFlatButton(
                  key: Key('logout'),
                  text: "Logout",
                  icon: Icons.power_settings_new,
                  onPress: () async {
                    await authenticationService.logout(dispatch: vm.dispatch).then((value) {
                      setState(() {
                      });
                    });
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Stack(
                children: [
                  Container(height: 30,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: TextFormField(
                      key: Key('search'),
                      decoration: InputDecoration(
                          floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                          hintText: "Search"
                      ),
                      onChanged: (text)  {
                        setState(() {
                          if(text.length>0){
                            _search.Filter(text,vm.products).then((value) {
                              _searchProducts=value;
                            });
                          }
                          else
                            _searchProducts=vm.products;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: _searchProducts.isNotEmpty?
                    ListView.builder(
                      shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: _searchProducts.length,
                        itemBuilder: (context, int index){
                        final item= _searchProducts[index];
                        return CardTile(
                          product: item,
                        );
                    }):Center(child: Text("No result found...", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
                      ,)),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _ViewModel {
  final User? user;
  final dynamic dispatch;
  final List<Product> products;

  _ViewModel(
      {required this.user,
        required this.dispatch,
      required this.products});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      user: store.state.user,
      dispatch: store.dispatch,
      products: store.state.products
    );
  }
}