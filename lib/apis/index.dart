import 'package:my_flutter/request/request.dart';

// 获取首页文章列表
Future getNews(Map query) =>
    DioUtil.dio.get('/api/4/news/latest', queryParameters: query);
// 获取文章详情
Future getArticle(Map query) => DioUtil.dio.get('/api/4/news/${query['id']}');
