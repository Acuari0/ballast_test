import 'package:ballast_test/data/repositories/obtain_data.dart';
import 'package:ballast_test/domain/services/abstract_delegate.dart';
import 'package:ballast_test/data/constants.dart' as Constant;

class Delegate extends AbstractDelegate{
  ObtainData _obtainData=ObtainData();
  @override
  Future<Map<String, dynamic>> obtainDescriptionElements(int id) async {
    try{
      Map<String,dynamic> response= await _obtainData.get(
          Constant.BASE_SUMMARY+id.toString(),
          {}) ;
      return response;
    }catch(e){
      print(e);
      return {};
    }

  }

  @override
  Future<List<dynamic>> obtainListElements() async {
    try{
      List<dynamic> response= await _obtainData.getList(Constant.BASE_URL,
          {}) ;
      return response ;
    }catch(e){
      print(e);
      return [];
    }
  }

}