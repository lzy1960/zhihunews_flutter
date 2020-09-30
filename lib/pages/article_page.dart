import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:my_flutter/apis/index.dart' as apis;
import 'package:my_flutter/model/data/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  final int id;

  const ArticlePage({Key key, this.id}) : super(key: key);
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ArticleModel articleInfo;
  Image _titleImage;
  Html _article;

  Future<void> getArticle() async {
    Map<String, dynamic> query = {'id': widget.id};
    Response res = await apis.getArticle(query);
    if (res != null) {
      // print(res.data);
      this.articleInfo = ArticleModel.fromJson(res.data);
      this._titleImage = Image.network(
        this.articleInfo.image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Text('获取失败');
        },
      );
      this._article = Html(
        data: this.articleInfo.body,
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    this.getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.articleInfo == null
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  this._titleImage,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: this._article,
                  ),
                ],
              ),
            ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 400.0,
            color: Colors.grey,
          ),
          Container(
            height: 200.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
