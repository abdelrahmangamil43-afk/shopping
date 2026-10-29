import 'dart:convert';

import 'package:flutter_application_1/core/network/api_result.dart';
import 'package:flutter_application_1/features/auth/data/models/login_response_model.dart';
import 'package:flutter_application_1/features/auth/data/models/register_request_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthApi {
  static Future<ApiResult<String>> register(
    RegisterRequestModel request,
  ) async {
    try {
      Uri url = Uri.parse(
        "https://supermarket-dan1.onrender.com/api/v1/auth/signUp",
      );

      var response = await http.post(
        url,
        body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return Success(json["message"]);
      } else {
        return Error("Error from server");
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }

  static Future<ApiResult<LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      Uri url = Uri.parse("http://localhost:5000/api/v1/auth/signIn");
      var response = await http.post(
        url,
        body: jsonEncode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return Success(LoginResponseModel.fromJson(json));
      } else {
        return Error("Error from server");
      }
    } catch (e) {
      return Error("Catch $e");
    }
  }
}
