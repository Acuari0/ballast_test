
import 'package:ballast_test/data/service/delegate.dart';
import 'package:ballast_test/domain/entities/models/products.dart';
import 'package:ballast_test/ui/common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class MockBuildContext extends Mock implements BuildContext {}
class MockDelegate extends Mock implements  Delegate{}

@GenerateMocks([MockBuildContext, MockDelegate])
void main() {
  Delegate delegate= Delegate();
  late MockDelegate mockDelegate;
  late MockBuildContext mockBuildContext;
  setUp(() {
    mockDelegate=MockDelegate();
    mockBuildContext=MockBuildContext();
  });
  group('Util test', () {
    test('Obtain elements', () async {
      dispatch(dynamic any) {
        return true;
      }
      List<Product> products=[];
      List<Product> product= await obtainElements(delegate, products, dispatch);

      expect(product.isNotEmpty, true);
    });
  });
}

