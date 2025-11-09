import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://vidwiz-backend.onrender.com';

  static Future<String> checkStatus() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['status'] ?? 'Server running!';
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Failed to connect: $e';
    }
  }
}
