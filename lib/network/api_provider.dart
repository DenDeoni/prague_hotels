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
      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        return _dataError(statusCode: response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> _dataError({required int statusCode}) {
    return {'status': statusCode};
  }
}
