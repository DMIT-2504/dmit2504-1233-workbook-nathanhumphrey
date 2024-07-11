import 'dart:convert';

import 'package:http/http.dart' as http;

/// Returns JSON from the [endpoint]
Future<dynamic> getJSON(String endpoint) async {
  final url = Uri.parse(endpoint);
  final response = await http.get(url);
  return jsonDecode(response.body);
}
