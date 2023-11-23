import 'dart:async';
import 'dart:convert';
import 'dart:io'; // Add this import for SocketException

import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http; // Add this import for http

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 60),
          );
      print(response);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExaption(''); // Provide a message for the exception
    } on TimeoutException {
      throw RequestTimeOutExaption(''); // Provide a message for the exception
    }
    return responseJson;
  }

  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data).timeout(
            const Duration(seconds: 60),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExaption(''); // Provide a message for the exception
    } on TimeoutException {
      throw RequestTimeOutExaption(''); // Provide a message for the exception
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson; // Return parsed JSON instead of the raw body
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson; // Return parsed JSON instead of the raw body
      case 401:
        throw UnauthorizedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw InternalServerErrorException('');
      default:
        throw FetchDataExaption('Error occurred: ${response.statusCode}');
    }
  }
}
