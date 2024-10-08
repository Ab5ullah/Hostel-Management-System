import 'package:flutter/material.dart';

class ApiUtils {
  static const String baseUrl = "https://unt-house-management.onrender.com/unt";
  static String login = "/student/login";
  static String resgister = "/student/saveStudent";
  static String createStaff = "/admin/create/staff";
  static String createIssue = "/maintenance/createIssue";
  static String roomAvailability = "/room/getRooms/AVAILABLE";
  static String roomChangeRequest = "/room/change/request";
  static String studentIssues = "/maintenance/fetch/issue/OPEN";
  static String staffInfo = "/admin/fetch/allStaff";
  static String deletestaff = "/admin/delete/staff/";
  static String studentInfo = "/student/getStudentDetails?studentEmailId=";
  static String studentRoomChangeReq = "/room/fetch/roomChange/requests";
  static String acceptOrReject = "/admin/approveOrReject";
  static String closeAnIssue = "/maintenance/close/issue/";
  static String updateProfile = "/student/updateStudent/";

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
