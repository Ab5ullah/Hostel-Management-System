import 'package:flutter/material.dart';

class ApiUtils {
  static const String baseUrl = "https://unt-house-management.onrender.com/unt";
  static String login = "/student/login";
  static String resgister = "/student/saveStudent";
  static String createStaff = "/admin/create/staff";
//user info
  static String email = '';
  static String roomNumber = '';
  static String blockNumber = '';
  static String username = '';
  static String firstName = '';
  static String lastName = '';
  static String phoneNumber = '';
  static int? roleId;

//snakbar
  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
