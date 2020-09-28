import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/model/data/banner_model.dart';
import 'package:my_flutter/apis/index.dart' as api;

import 'home_banner.dart';
import 'home_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TopStories> banners = [];
  List<Stories> listData = [];

  @override
  void initState() {
    this.getNews();
    super.initState();
  }

  Future getNews() async {
    Map<String, dynamic> query = {};
    Response res = await api.getNews(query);
    if (res != null) {
      print(res.data);
      res.data['top_stories'].forEach((item) {
        this.banners.add(TopStories.fromJson(item));
      });
      res.data['stories'].forEach((item) {
        this.listData.add(Stories.fromJson(item));
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '上',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text('27'),
              ],
            ),
            title: Text('大标题'),
            expandedHeight: 400.0,
            backgroundColor: Theme.of(context).primaryColor,
            // floating: true,
            pinned: true,
            // snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: HomeBanner(banners: this.banners),
            ),
            // flexibleSpace: HomeBanner(banners: this.banners),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              this.listData.map((item) => HomeListItem(data: item)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
