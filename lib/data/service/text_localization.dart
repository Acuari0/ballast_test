import 'package:ballast_test/domain/services/abstract_text_loalization.dart';
import 'package:ballast_test/i18n/en.dart';

class TextLocalization extends AbstractTextLocalization{
  @override
  String text({String? id}) {
    if(en.containsKey(id))
      return en[id!]!;
    return'';
  }



}