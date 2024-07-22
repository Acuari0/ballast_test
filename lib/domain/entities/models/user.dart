import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User {
  String? name, token;



  User({String? name,
    String? token,
  }) {
    this.name=name;
    this.token=token;
  }

  factory User.defaultValues()=>User(name: "", token: "");

  void doAdmin(){
    this.name="Admin";
    this.token="token";
  }

  void getToken()  {
    FlutterSecureStorage? storage=  FlutterSecureStorage();
    storage.read(key: "token").then((value) =>this.token=value);
  }

  Map<String, dynamic> toJson() => {
    'name':name,
    'token':token
  };

  @override
  String toString() {
    return 'User: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}