import 'package:ballast_test/data/repositories/obtain_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ballast_test/data/constants.dart' as Constant;

void main(){
  group('Obtain Data', () {
    ObtainData obtainData= ObtainData();
    test('getList sucessfull', () async {
      List<dynamic> response= await obtainData.getList(Constant.BASE_URL,
          {});
      expect(response.isNotEmpty, true);
    });
    test('getList bad', () async {
      List<dynamic> response= await obtainData.getList("gg",
          {});
      expect(response.isNotEmpty, false);
    });

    test('get sucessfull', () async {
      Map<String,dynamic> response= await obtainData.get(Constant.BASE_SUMMARY,
          {});
      expect(response.isNotEmpty, false);
    });
    test('get bad', () async {
      Map<String,dynamic>  response= await obtainData.get("gg",
          {});
      expect(response, {});
    });


  });
}