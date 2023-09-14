import 'dart:convert';
import 'dart:developer';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<Map<String, dynamic>> request({required QueryParamsModel queryParams}) async {
    try {
      final response = await http.post(
        Uri.parse(listEndPoint),
        headers: {
          'X-RapidAPI-Key': '1578822c28msh62e31662f29da8bp112d80jsnc4f654861ef2',
          'X-RapidAPI-Host': 'hotels4.p.rapidapi.com',
        },
        body:
        jsonEncode(queryParams.toJson()),
      );
      if (response.statusCode == 200) {
        var data = json.decode(utf8.decode(response.bodyBytes));
        return data;
      } else {
        print('ERROR');
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
