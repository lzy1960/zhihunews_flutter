import 'package:flutter/material.dart';
import 'package:my_flutter/pages/home.dart';
import 'package:my_flutter/request/request.dart';

void main() {
  DioUtil.addInterceptors();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
