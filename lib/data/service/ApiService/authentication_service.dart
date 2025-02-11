import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class ApiService {
  static const String baseUrl = 'http://40.90.224.241:5000';

  final storage = GetStorage();

  Future<bool> requestOtp(int countryCode, int mobileNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/otpCreate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'countryCode': countryCode,
        'mobileNumber': mobileNumber,
      }),
    );

    return response.statusCode == 200;
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
      final cookie = response.headers['set-cookie'];
      if (cookie != null) {
        storage.write('cookie', cookie);
        print('Cookie: $cookie');
      }
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    final cookie = storage.read('cookie') ?? '';
    final response = await http.get(
      Uri.parse('$baseUrl/isLoggedIn'),
      headers: {
        'Content-Type': 'application/json',
        'Cookie': cookie,
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Headers: ${response.headers}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final isLoggedIn = data['isLoggedIn'];

      if (isLoggedIn) {
        final csrfToken = data['csrfToken'];

        if (csrfToken != null) {
          storage.write('csrfToken', csrfToken);
          print('CSRF Token: $csrfToken');
          print('Cookie: $cookie');
          return true;
        } else {
          print('CSRF Token not found in the response');
          return false;
        }
      } else {
        print('User is not logged in');
        return false;
      }
    } else {
      print('Failed to fetch user data');
      return false;
    }
  }

  Future<bool> isNameUpdated() async {
    final response = await http.get(
      Uri.parse('$baseUrl/isNameUpdated'),
      headers: {
        'Content-Type': 'application/json',
        'X-Csrf-Token': storage.read('csrfToken') ?? '',
        'Cookie': storage.read('cookie') ?? '',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['isNameUpdated'];
    } else {
      return false;
    }
  }

  Future<bool> updateUser(int countryCode, String userName) async {
    final csrfToken = storage.read('csrfToken') ?? '';
    final cookie = storage.read('cookie') ?? '';
    print('CSRF Token: $csrfToken');
    print('Cookie: $cookie');

    final response = await http.post(
      Uri.parse('$baseUrl/update'),
      headers: {
        'Content-Type': 'application/json',
        'X-Csrf-Token': csrfToken,
        'Cookie': cookie,
      },
      body: jsonEncode({
        'countryCode': countryCode,
        'userName': userName,
      }),
    );

    return response.statusCode == 200;
  }

  Future<bool> logout() async {
    final csrfToken = storage.read('csrfToken') ?? '';
    final cookie = storage.read('cookie') ?? '';
    print('CSRF Token: $csrfToken');
    print('Cookie: $cookie');

    final response = await http.get(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Content-Type': 'application/json',
        'X-Csrf-Token': csrfToken,
        'Cookie': cookie,
      },
    );

    if (response.statusCode == 200) {
      storage.erase();
      return true;
    } else {
      return false;
    }
  }
}