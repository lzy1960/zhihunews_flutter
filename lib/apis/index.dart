import 'package:my_flutter/request/request.dart';

Future getNews(Map query) =>
    DioUtil.dio.get('/api/4/news/latest', queryParameters: query);
