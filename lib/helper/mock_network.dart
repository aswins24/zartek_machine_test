import 'dart:convert';

import 'network_helper.dart';

class MockNetwork {
  NetworkHelper connection = NetworkHelper();
  String baseUrl = 'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad';
  var responseBody;

  Future<dynamic> getMockData() async {
    try {
      responseBody = await connection.getConnection(baseUrl);

      var decodedJson = jsonDecode(responseBody);
      return decodedJson;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
