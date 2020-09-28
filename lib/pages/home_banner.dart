import 'package:flutter/material.dart';
import 'package:my_flutter/model/data/banner_model.dart';

class HomeBanner extends StatefulWidget {
  final List<TopStories> banners;

  const HomeBanner({Key key, this.banners}) : super(key: key);
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (val) {},
      children: widget.banners.map((item) => BannerItem(banner: item)).toList(),
    );
  }
}

// 单个
class BannerItem extends StatelessWidget {
  final TopStories banner;
  const BannerItem({
    Key key,
    @required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          banner.image,
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Color(int.parse(banner.imageHue)).withOpacity(0),
                Color(int.parse(banner.imageHue)).withOpacity(0.9),
                Color(int.parse(banner.imageHue)).withOpacity(1),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      banner.title,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    banner.hint,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
