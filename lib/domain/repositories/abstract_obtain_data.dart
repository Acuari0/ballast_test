abstract class AbstractObtainData {

  Future<dynamic> getList(String url,Map<String, String> head);

  Future<dynamic> get(String url, Map<String, String> head);

}