class ArticleModel {
  String body;
  String imageHue;
  String imageSource;
  String title;
  String url;
  String image;
  String shareUrl;
  List<String> js;
  String gaPrefix;
  List<String> images;
  int type;
  int id;
  List<String> css;

  ArticleModel(
      {this.body,
      this.imageHue,
      this.imageSource,
      this.title,
      this.url,
      this.image,
      this.shareUrl,
      this.js,
      this.gaPrefix,
      this.images,
      this.type,
      this.id,
      this.css});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    imageHue = json['image_hue'];
    imageSource = json['image_source'];
    title = json['title'];
    url = json['url'];
    image = json['image'];
    shareUrl = json['share_url'];
    js = json['js'].cast<String>();
    gaPrefix = json['ga_prefix'];
    images = json['images'].cast<String>();
    type = json['type'];
    id = json['id'];
    css = json['css'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['image_hue'] = this.imageHue;
    data['image_source'] = this.imageSource;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image'] = this.image;
    data['share_url'] = this.shareUrl;
    data['js'] = this.js;
    data['ga_prefix'] = this.gaPrefix;
    data['images'] = this.images;
    data['type'] = this.type;
    data['id'] = this.id;
    data['css'] = this.css;
    return data;
  }
}
