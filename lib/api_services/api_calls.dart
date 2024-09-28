// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'dart:convert';
import 'package:hostel_management_system/api_services/api_provider.dart';
import 'package:hostel_management_system/features/auth/screens/login_screen.dart';
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
        // ignore: use_build_context_synchronously
        ApiUtils.showErrorSnackbar(context, responseBody['error']);
      }
      final UserResponse userResponse = UserResponse.fromJson(responseBody);
      // ignore: avoid_print
      print("user email: ${userResponse.result[0].emailId}");
      ApiUtils.email = userResponse.result[0].emailId!;
      ApiUtils.phoneNumber = userResponse.result[0].phoneNumber!.toString();
      ApiUtils.roomNumber = userResponse.result[0].roomNumber!.toString();
      ApiUtils.username = userResponse.result[0].userName!;
      ApiUtils.blockNumber = userResponse.result[0].block!.toString();
      ApiUtils.firstName = userResponse.result[0].firstName!;
      ApiUtils.lastName = userResponse.result[0].lastName!;
      ApiUtils.roleId = userResponse.result[0].roleId!.roleId;

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

  Future<String?> resgisterStudent(
    BuildContext context,
    String userName,
    String firstName,
    String lastName,
    String emailId,
    String password,
    String phoneNumber,
    String blockNumber,
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
      "block": blockNumber,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.resgister,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['status'] == "Student created successfully") {
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
      if (response.statusCode == 202) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody['status'] == "Student Already Exists") {
          ApiUtils.showErrorSnackbar(context, responseBody['status']);
        }
      }
    }
    return null;
  }

  Future<String?> createStaff(
    BuildContext context,
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String phoneNumber,
    String jobRole,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "userName": username,
      "emailId": email,
      "password": password,
      "roleId": 3,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "jobRole": jobRole
    };
    final response = await apiProvider.postResponse(
      ApiUtils.createStaff,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }

  Future<String?> createAnIssue(
    BuildContext context,
    String roomNumber,
    String blockNumber,
    String email,
    String issue,
    String phoneNumber,
    String comment,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "roomNumber": roomNumber,
      "block": blockNumber,
      "issue": issue,
      "studentComment": comment,
      "studentEmailId": email,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.createIssue,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }
}
