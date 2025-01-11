import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../constants/api_params.dart';
import '../../../constants/app_constants.dart';

class Wrapper {
  static Future<String> post(String url, String? body,
      {Map<String, String>? customHeaders}) async {
    try {
      final response =
          await http.post(Uri.tryParse(url)!, body: body, headers: {
        if (ApiParams.getInstance()?.authorization != null)
          'Authorization': ApiParams.getInstance()!.authorization!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if (response.statusCode == 401) {
        throw 'User is unauthorized. Please logout and login again or contact Musclify customer support';
      } else {
        throw AppConstants.getErrorMessage(response.body);
      }
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> get(String url,
      {Map<String, String>? customHeaders}) async {
    try {
      final response = await http.get(Uri.tryParse(url)!, headers: {
        if (ApiParams.getInstance()?.authorization != null)
          'Authorization': ApiParams.getInstance()!.authorization!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if (response.statusCode == 401) {
        throw 'User is unauthorized. Please logout and login again or contact Musclify customer support';
      } else {
        throw AppConstants.getErrorMessage(response.body);
      }
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> put(String url, String? body,
      {Map<String, String>? customHeaders}) async {
    try {
      final response = await http.put(Uri.tryParse(url)!, body: body, headers: {
        if (ApiParams.getInstance()?.authorization != null)
          'Authorization': ApiParams.getInstance()!.authorization!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if (response.statusCode == 401) {
        throw 'User is unauthorized. Please logout and login again or contact Musclify customer support';
      } else {
        throw AppConstants.getErrorMessage(response.body);
      }
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> delete(String url,
      {String? body, Map<String, String>? headers}) async {
    try {
      final response =
          await http.delete(Uri.tryParse(url)!, body: body, headers: {
        if (ApiParams.getInstance()?.authorization != null)
          'Authorization': ApiParams.getInstance()!.authorization!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 204) {
        throw 'No Item Found';
      } else if (response.statusCode == 401) {
        throw 'User is unauthorized. Please logout and login again or contact Musclify customer support';
      } else {
        throw AppConstants.getErrorMessage(response.body);
      }
    } on SocketException {
      throw _handleSocketException();
    } catch (e) {
      rethrow;
    }
  }

  static SocketException _handleSocketException() {
    return const SocketException(
        'No internet. Please check your internet connection');
  }
}
