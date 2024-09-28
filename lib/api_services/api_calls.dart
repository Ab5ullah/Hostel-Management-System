// ignore_for_file: use_build_context_synchronously, duplicate_ignore
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';
import 'package:provider/provider.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/home/screen/home_screen.dart';
import '../models/user_response.dart';
import 'api_provider.dart';

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

  Future<String?> roomChangeRequest(
    BuildContext context,
    String changeRoomNumber,
    String changeBlockNumber,
    String reason,
  ) async {
    final Map<String, dynamic> requestData = {
      "currentRoomNumber": ApiUtils.roomNumber,
      "toChangeRoomNumber": changeRoomNumber,
      "currentBlock": ApiUtils.blockNumber,
      "toChangeBlock": changeBlockNumber,
      "studentEmailId": ApiUtils.email,
      "changeReason": reason,
    };
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.postResponse(
      ApiUtils.roomChangeRequest,
      headers: {
        "Content-Type": "application/json",
      },
      body: requestData,
    );
    print(response.body);
    print(requestData);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        // ignore: use_build_context_synchronously
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);
        // ignore: use_build_context_synchronously
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

  void deleteStaff(BuildContext context, String emailId) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.deleteResponse(
      '${ApiUtils.deletestaff}$emailId',
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        // ignore: use_build_context_synchronously
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
  }

  Future<String?> approveOrRejectRequest(
    BuildContext context,
    int requestId,
    String adminComment,
    String action,
  ) async {
    final Map<String, dynamic> requestData = {
      "roomChangeRequestId": requestId,
      "approveOrReject": action,
      "adminComment": adminComment,
    };
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.postResponse(
      ApiUtils.acceptOrReject,
      headers: {
        "Content-Type": "application/json",
      },
      body: requestData,
    );
    print(response.body);
    print(requestData);
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        // ignore: use_build_context_synchronously
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );

        // return responseBody['msg'];
      }
    }
    return null;
  }

  Future<String?> closeAnIssue(
    BuildContext context,
    int issueId,
    String staffComment,
  ) async {
    final Map<String, dynamic> requestData = {
      "issueId": issueId,
      "staffComment": staffComment,
    };
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.postResponse(
      ApiUtils.closeAnIssue,
      headers: {
        "Content-Type": "application/json",
      },
      body: requestData,
    );
    print(response.body);
    print(requestData);
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        // ignore: use_build_context_synchronously
        ApiUtils.showSuccessSnackbar(context, responseBody['status']);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );

        // return responseBody['msg'];
      }
    }
    return null;
  }

  void updateProfile(
    BuildContext context,
    String userName,
    String firstName,
    String lastName,
    String phoneNumber,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "userName": userName,
      "emailId": ApiUtils.email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
    };

    try {
      final response = await apiProvider.postResponse(
        ApiUtils.updateProfile,
        headers: {
          "Content-Type": "application/json",
        },
        body: requestData,
        // includeBearerToken: true,
      );
      if (response.statusCode == 202) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        print(responseBody);
        // ignore: use_build_context_synchronously
        ApiUtils.showSuccessSnackbar(context, 'Profile Updated Successfully');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        final Map<String, dynamic> errorResponse = json.decode(response.body);
        final String errorMessage = errorResponse['msg'];
        print("Error message: $errorMessage");
        // ignore: use_build_context_synchronously
        ApiUtils.showErrorSnackbar(context, errorMessage);
      }
    } catch (e) {
      ApiUtils.showErrorSnackbar(context, e.toString());
    }
  }
}
