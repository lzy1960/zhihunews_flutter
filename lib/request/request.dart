import 'package:dio/dio.dart';
import 'package:my_flutter/config/config.dart';

class DioUtil {
  const DioUtil();
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Config.BASEURL,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ),
  );

  static Dio addInterceptors() {
    return dio..interceptors.add(CustomInterceptor());
  }
}

class CustomInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print('开始请求 $options');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    print('开始响应 $response');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    print('报错 $err');
    print('${err.type}');
    return super.onError(err);
  }
}
