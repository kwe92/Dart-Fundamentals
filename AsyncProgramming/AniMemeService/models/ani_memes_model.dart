class AniMemeModel {
  final String _title;
  final String _imgUrl;

  String get title => this._title;
  String get imgUrl => this._imgUrl;

  const AniMemeModel._(this._title, this._imgUrl);

  factory AniMemeModel.fromJSON(Map<String, dynamic> json) => AniMemeModel._(
        json['title'],
        json['url'],
      );
}
