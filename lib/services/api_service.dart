import "dart:convert";

import "package:google_app/config/api_keys.dart";
import "package:http/http.dart" as http;

import "../config/api_json.dart";

class ApiService {
  bool isDummyData = treu;

  Future<Map<String, dynamic>> fetchData({required String queryTerm, String start = "0"}) async {
    try {
      if (!isDummyData) {
        String q = queryTerm.contains(" ") ? queryTerm.split(" ").join("%20") : queryTerm;
        final response = await http.get(
          Uri.parse('https://www.googleapis.com/customsearch/v1?key=$api_key&cx=$contextKey&q=$q&start=$start'),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final responseData = json.decode(jsonData);
          return responseData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
