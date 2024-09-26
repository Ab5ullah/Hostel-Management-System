import 'package:flutter/material.dart';

class ApiUtils {
  static const String baseUrl = "https://unt-house-management.onrender.com/unt";
  static String login = "/student/login";
  static String resgister = "/student/saveStudent";

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
