import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class ApiService {
  final http.Client _client;
  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, dynamic>> translate(String text) async {
    final uri = Uri.parse("${ApiConfig.baseUrl}/translate");
    final res = await _client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"text": text}),
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    throw Exception("Erro ao traduzir: ${res.statusCode} ${res.body}");
  }

  Future<List<dynamic>> listPhrases({String? category}) async {
    final uri = Uri.parse("${ApiConfig.baseUrl}/dictionary/phrases${category != null ? "?category=$category" : ""}");
    final res = await _client.get(uri);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as List<dynamic>;
    }
    throw Exception("Erro ao buscar frases: ${res.statusCode} ${res.body}");
  }

  Future<List<dynamic>> listLessons() async {
    final uri = Uri.parse("${ApiConfig.baseUrl}/lessons");
    final res = await _client.get(uri);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      return jsonDecode(res.body) as List<dynamic>;
    }
    throw Exception("Erro ao buscar aulas: ${res.statusCode} ${res.body}");
  }
}
