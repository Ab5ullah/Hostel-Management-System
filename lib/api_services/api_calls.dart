import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_management_system/api_services/api_provider.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';

class ApiCalls {
  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "emailId": email,
      "password": password,
    };
    final response = await apiProvider.postResponse(ApiUtils.login,
        headers: {'Content-Type': 'app;ication/json'}, body: requestData);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
    }
  }
}
