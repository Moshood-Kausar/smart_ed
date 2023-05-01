import "package:dio/dio.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:smart_ed/utils/texts.dart";

const String baseUrl = "https://8424-102-176-246-53.ngrok-free.app";

class Client {
  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(ApiInterceptors());
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  final Dio _dio = Dio();
  Dio tokenDio = Dio();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var box = Hive.box(infobox).listenable();
    String accessToken = box.value.get('access', defaultValue: 'defaultvalue');
    if (accessToken != 'defaultvalue') {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    var box = Hive.box(infobox).listenable();
    String accessToken = box.value.get('access', defaultValue: 'default value');
    if (err.response?.statusCode == 402) {
      final options = err.response!.requestOptions;

      final tokenResult = await tokenDio.post(
        '${baseUrl}referesh-token',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (tokenResult.statusCode != null &&
          tokenResult.statusCode! ~/ 100 == 2) {
        final body = tokenResult.data as Map<String, dynamic>;

        if (body['status']) {
          box.value.put('access', body['access']);

          options.headers['Authorization'] = "Bearer ${body['access']}";
          final originResult = await _dio.fetch(options);
          if (originResult.statusCode != null &&
              originResult.statusCode! ~/ 100 == 2) {
            return handler.resolve(originResult);
          }
        }
      }

      return handler.reject(
        DioError(requestOptions: options),
      );
    }
    return handler.next(err);
  }
}
