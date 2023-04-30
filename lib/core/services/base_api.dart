import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smart_ed/core/services/api_client.dart';

const Duration timeOut = Duration(seconds: 40);
Client _client = Client();
const String nointernet = "No internet connection";
const String timeMsg = "Request timeout, connect to a better network";
const String msg = "An error occured: ";
const String apiKey = "7c760c888117450f9ac628d1e86a7517";

Future getRequest({
  required String url,
  String? baseUrl,
  required void Function(Response response) onResponse,
  required void Function(ApiResponse response, {dynamic error}) onError,
}) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      final dio = _client.init();

      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }
      final response = await dio.get(url);
      print('sfsfs ${response.data}');
      onResponse(response);
    } else {
      onError(ApiResponse(message: nointernet, status: false));
    }
  } on DioError catch (e) {
    print('sfsfs $e');
    onError(
      ApiResponse(
        message: e.response != null
            ? e.response!.data['message']
            : e.message ?? 'An error occured, try again',
        status: false,
      ),
      error: e,
    );
  } on SocketException catch (_) {
    onError(ApiResponse(message: nointernet, status: false));
  } on TimeoutException catch (_) {
    onError(ApiResponse(message: timeMsg, status: false));
  } catch (e) {
    onError(ApiResponse(message: msg, status: false), error: e);
  }
}

Future postRequest({
  required String url,
  Object? body,
  required void Function(Response response) onResponse,
  required void Function(ApiResponse response, {dynamic error}) onError,
  Options? options,
  String? baseUrl,
}) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      final dio = _client.init();
      print(dio.options.baseUrl);
      if (baseUrl != null) {
        dio.options.baseUrl = baseUrl;
      }
      final response = await dio.post(url, data: body, options: options);
      print('sfsfs ${response.data}');
      onResponse(response);
    } else {
      onError(ApiResponse(message: nointernet, status: false));
    }
  } on DioError catch (e) {
    print('sfsfs $e');
    onError(
      ApiResponse(
        message: !e.response!.data.contains('html')
            ? e.response != null
                ? "${e.response!.data['detail']}"
                : e.message ?? 'An error occured, try again'
            : "An error occured, try again",
        status: false,
      ),
      error: e,
    );
  } on SocketException catch (_) {
    onError(ApiResponse(message: nointernet, status: false));
  } on TimeoutException catch (_) {
    onError(ApiResponse(message: timeMsg, status: false));
  } catch (e) {
    onError(ApiResponse(message: msg, status: false), error: e);
  }
}

class ApiResponse {
  final bool status;
  final String message;
  final dynamic data;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });
}
