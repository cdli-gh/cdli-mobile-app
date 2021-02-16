import 'dart:convert';

class CDLIData {
  final String date;
  final String thumbnailUrl;
  final String url;
  final String blurbTitle;
  final String theme;
  final String blurb;
  final String fullTitle;
  final String fullInfo;

  CDLIData(
      {this.date,
      this.thumbnailUrl,
      this.url,
      this.blurbTitle,
      this.theme,
      this.blurb,
      this.fullTitle,
      this.fullInfo});

  static List<CDLIData> fromJsonArray(String covariant) {
    List data = json.decode(covariant);
    List<CDLIData> result = [];

    for (var i = 0; i < data.length; i++) {
      result.add(new CDLIData(
          date: data[i]['date'],
          thumbnailUrl: data[i]['thumbnail-url'],
          url: data[i]['url'],
          blurbTitle: data[i]['blurb-title'],
          theme: data[i]['theme'],
          blurb: data[i]['blurb'],
          fullTitle: data[i]['full-title'],
          fullInfo: data[i]['full-info']));
    }
    return result;
  }

  getTitle() {
    return this.fullTitle;
  }
}
