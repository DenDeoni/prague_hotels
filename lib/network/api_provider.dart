import 'dart:convert';
import 'package:prague_hotels/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> request({required Map<String, dynamic> queryParams, required endPoint}) async {
    try {
      final response = await http.post(
        Uri.parse(endPoint),
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'hotels4.p.rapidapi.com',
        },
        body: jsonEncode(queryParams),
      );
      var data = json.decode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      throw Exception('EXCEPTION: $e');
    }
  }
}
