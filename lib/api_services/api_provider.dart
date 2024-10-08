// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package correctly

class ApiProvider extends ChangeNotifier {
  final String baseUrl;
  final http.Client httpClient;

  ApiProvider({
    required this.baseUrl,
    required this.httpClient,
  });
  Future<http.Response> postResponse(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final Uri uri = Uri.parse("$baseUrl$endpoint");
    final Map<String, String>? headers = {
      'Content-Type': 'application/json',
    };
    final String jsonBody = body != null ? json.encode(body) : '';
    final response =
        await httpClient.post(uri, headers: headers, body: jsonBody);
    print("Requesttt: ${response.body}");
    return response;
  }

  Future<http.Response> getResponse(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final Uri uri = Uri.parse("$baseUrl$endpoint");
    final Map<String, String>? headers = {
      'Content-Type': 'application/json',
    };
    final response = await httpClient.get(uri, headers: headers);
    print("Requesttt: ${response.body}");
    return response;
  }

  Future<http.Response> deleteResponse(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final Uri uri = Uri.parse("$baseUrl$endpoint");
    final Map<String, String>? headers = {
      'Content-Type': 'application/json',
    };
    final response = await httpClient.delete(uri, headers: headers);
    print("Requesttt: ${response.body}");
    return response;
  }
}
