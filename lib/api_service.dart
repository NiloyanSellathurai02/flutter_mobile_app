import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://team-management-api.dops.tech/api/v1';

  Future<List<String>> fetchTeams() async {
    final response = await http.get(Uri.parse('$baseUrl/teams'));

    if (response.statusCode == 200) {
      // Parse de JSON-respons
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data']; // Haal het 'data'-object op

      // Haal de 'name'-eigenschappen van de teams op
      return data.map((team) => team['name'] as String).toList();
    } else {
      throw Exception('Failed to load teams: ${response.statusCode}');
    }
  }
}
