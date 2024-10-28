class AniMemesModel {
  final String title;
  final String imgUrl;

  const AniMemesModel(this.title, this.imgUrl);

  AniMemesModel.fromJSON(Map<String, dynamic> json)
      : title = json['title'],
        imgUrl = json['url'];
}
