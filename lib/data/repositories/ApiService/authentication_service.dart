import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://40.90.224.241:5000';

  Future<bool> requestOtp(int countryCode, int mobileNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpCreate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> validateOtp(int countryCode, int mobileNumber, int otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpValidate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}