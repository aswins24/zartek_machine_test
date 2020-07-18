import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> getConnection(String url) async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("getConnection");
        return response.body;
      } else
        return null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
