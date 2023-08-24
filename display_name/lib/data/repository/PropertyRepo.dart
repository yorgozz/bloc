import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:display_name/data/models/propertyModel.dart';

class PropertyRepo {
  Future<List<PropertyModel>> getAllAvailableProperties() async {
    final response = await http.get(Uri.parse(
        'http://192.168.88.10:31535/otonomus/inventory/api/v1/spaces/available_spaces'));

    if (response.statusCode == 200) {
      //print('fetched properties');
      var decodedResponse = jsonDecode(response.body);
      var result = decodedResponse['data'] as List;
      final properties =
          result.map((map) => PropertyModel.fromJson(map)).toList();
      return properties;
    } else {
      throw Exception('Failed to fetch properties');
    }
  }
}
