import 'dart:convert';
import 'package:hostel_management_system/api_services/api_provider.dart';
import 'package:hostel_management_system/features/home/screen/home_screen.dart';
import 'package:hostel_management_system/models/user_response.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';

class ApiCalls {
  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "emailId": email,
      "password": password,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.login,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['status'] == "FAILED") {
        ApiUtils.showErrorSnackbar(context, responseBody['error']);
      }
      final UserResponse userResponse = UserResponse.fromJson(responseBody);
      print("user email: ${userResponse.result[0].emailId}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      ApiUtils.showErrorSnackbar(
        context,
        errorResponse['msg'],
      );
    }
  }

  Future<void> resgisterStudent(
    BuildContext context,
    String userName,
    String firstName,
    String lastName,
    String emailId,
    String password,
    String phoneNumber,
    String block,
    String roomNumber,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "userName": userName,
      "emailId": emailId,
      "password": password,
      "roleId": 2,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "roomNumber": roomNumber,
      "block": block,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.resgister,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['status'] == "FAILED") {
        ApiUtils.showErrorSnackbar(context, responseBody['error']);
      }
      final UserResponse userResponse = UserResponse.fromJson(responseBody);
      print("user email: ${userResponse.result[0].emailId}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      ApiUtils.showErrorSnackbar(
        context,
        errorResponse['msg'],
      );
    }
  }
}
