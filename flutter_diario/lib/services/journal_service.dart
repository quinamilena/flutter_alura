import 'dart:convert';
import 'dart:io';

import 'package:flutter_diario/models/journal.dart';
import 'package:flutter_diario/services/webclient.dart';
import 'package:http/http.dart' as http;

class JournalService {
  String url = WebClient.url;
  http.Client client = WebClient().client;

  static const String resource = "journals/";

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal, String token) async {
    String json = jsonEncode(journal.toMap());

    final response = await client.post(
      Uri.parse(getUrl()),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json,
    );

    if (response.statusCode != 201) {
      if (jsonDecode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }

      throw HttpException(response.body);
    }

    return true;
  }

  Future<bool> edit(String id, Journal journal, String token) async {
    journal.updatedAt = DateTime.now();
    
    String json = jsonEncode(journal.toMap());

    final response = await client.put(
      Uri.parse('${getUrl()}$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: json,
    );

    if (response.statusCode != 200) {
      if (jsonDecode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }

      throw HttpException(response.body);
    }

    return true;
  }

  Future<List<Journal>> getAll({
    required String id,
    required String token,
  }) async {
    http.Response response = await client.get(
      Uri.parse("${url}users/$id/journals"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode != 200) {
      if (jsonDecode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }

      throw HttpException(response.body);
    }

    List<Journal> journals = [];
    List<dynamic> data = jsonDecode(response.body);

    for (var jsonMap in data) {
      journals.add(Journal.fromMap(jsonMap));
    }

    return journals;
  }

  Future<bool> delete(String id, String token) async {
    http.Response response = await client.delete(
      Uri.parse("${getUrl()}$id"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode != 200) {
      if (jsonDecode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }

      throw HttpException(response.body);
    }

    return true;
  }
}

class TokenNotValidException implements Exception {}
