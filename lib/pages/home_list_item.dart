import 'package:flutter/material.dart';
import 'package:my_flutter/model/data/banner_model.dart';

class HomeListItem extends StatefulWidget {
  final Stories data;

  const HomeListItem({Key key, this.data}) : super(key: key);
  @override
  _HomeListItemState createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor,
      child: GestureDetector(
        onTap: () {
          print(widget.data.id);
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.data.hint,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Image.network(widget.data.images[0]),
          ],
        ),
      ),
    );
  }
}
