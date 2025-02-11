import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilterService extends GetxService {

  Future<Map<String, List<String>>> fetchFilters() async {
    try {
      final response = await http.get(Uri.parse('http://40.90.224.241:5000/showSearchFilters'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final dataObject = data['dataObject'] as Map<String, dynamic>;

        // Convert each list in dataObject to List<String>
        final Map<String, List<String>> filters = dataObject.map((key, value) {
          return MapEntry(key, List<String>.from(value));
        });

        return filters;
      } else {
        throw Exception('Failed to load filters');
      }
    } catch (e) {
      throw Exception('Error fetching filters: $e');
    }
  }
}