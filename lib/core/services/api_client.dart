import "package:dio/dio.dart";

const String baseUrl = "base_url";

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
    // get hive data

    options.headers['Authorization'] = 'Bearer user-accessToken ';

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    /// get hive data
    if (err.response?.statusCode == 401) {
      final options = err.response!.requestOptions;

      final tokenResult = await tokenDio.post(
        '${baseUrl}authtoken',
        options: Options(
          headers: {'Authorization': 'Bearer user-accessToken'},
        ),
      );

      if (tokenResult.statusCode != null &&
          tokenResult.statusCode! ~/ 100 == 2) {
        final body = tokenResult.data as Map<String, dynamic>;

        if (body['status']) {
          /// save new access token
          // await UserDB().saveuserInfo(
          //   user.copyWith(accessToken: body['accessToken']),
          // );
          options.headers['Authorization'] = "Bearer ${body['accessToken']}";
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
