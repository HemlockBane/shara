import 'package:dio/dio.dart';

import '../../../api_config.dart';

class AuthInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[xRapidApiKey] = ApiConfig.xRapidApiKey;
    options.headers[xRapidApiHost] = ApiConfig.xRapidApiHost;
    super.onRequest(options, handler);
  }
}