import 'dart:convert';
import 'package:ballast_test/domain/repositories/abstract_obtain_data.dart';
import 'package:http/http.dart' as http;
class ObtainData extends AbstractObtainData{

  final http.Client _client=http.Client();

  @override
  Future get(String url, Map<String, String> head) async {
    try {
      http.Response response = await _client.get(Uri.parse(url), headers: head);
      _client.close();
      return json.decode(response.body);
    }catch(e){
      Map<String,dynamic> map={};
      return map;
    }
  }

  @override
  Future getList(String url, Map<String, String> head) async {
    try{
      http.Response response = await _client.get(Uri.parse(url), headers: head);
      _client.close();
      return json.decode(response.body);
    }catch(e){
      return [];
    }

  }
  
}