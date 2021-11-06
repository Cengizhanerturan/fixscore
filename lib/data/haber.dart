// To parse this JSON data, do
//
//     final Haber = HaberFromJson(jsonString);

import 'dart:convert';

Haber haberFromJson(String str) => Haber.fromJson(json.decode(str));

String haberToJson(Haber data) => json.encode(data.toJson());

class Haber {
  Haber({
    this.type,
    this.didUMean,
    this.totalCount,
    this.relatedSearch,
    this.value,
  });

  String? type;
  String? didUMean;
  int? totalCount;
  List<dynamic>? relatedSearch;
  List<Value>? value;

  factory Haber.fromJson(Map<String, dynamic> json) => Haber(
        type: json["_type"],
        didUMean: json["didUMean"],
        totalCount: json["totalCount"],
        relatedSearch: List<dynamic>.from(json["relatedSearch"].map((x) => x)),
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "didUMean": didUMean,
        "totalCount": totalCount,
        "relatedSearch": List<dynamic>.from(relatedSearch!.map((x) => x)),
        "value": List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.id,
    this.title,
    this.url,
    this.description,
    this.body,
    this.snippet,
    this.keywords,
    this.language,
    this.isSafe,
    this.datePublished,
    this.provider,
    this.image,
  });

  String? id;
  String? title;
  String? url;
  String? description;
  String? body;
  String? snippet;
  String? keywords;
  String? language;
  bool? isSafe;
  DateTime? datePublished;
  Provider? provider;
  Image? image;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        description: json["description"],
        body: json["body"],
        snippet: json["snippet"],
        keywords: json["keywords"],
        language: json["language"],
        isSafe: json["isSafe"],
        datePublished: DateTime.parse(json["datePublished"]),
        provider: Provider.fromJson(json["provider"]),
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "description": description,
        "body": body,
        "snippet": snippet,
        "keywords": keywords,
        "language": language,
        "isSafe": isSafe,
        "datePublished": datePublished!.toIso8601String(),
        "provider": provider!.toJson(),
        "image": image!.toJson(),
      };
}

class Image {
  Image({
    this.url,
    this.height,
    this.width,
    this.thumbnail,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.base64Encoding,
    this.name,
    this.title,
    this.provider,
    this.imageWebSearchUrl,
    this.webpageUrl,
  });

  String? url;
  int? height;
  int? width;
  String? thumbnail;
  int? thumbnailHeight;
  int? thumbnailWidth;
  dynamic base64Encoding;
  dynamic name;
  dynamic title;
  Provider? provider;
  dynamic imageWebSearchUrl;
  String? webpageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        height: json["height"],
        width: json["width"],
        thumbnail: json["thumbnail"],
        thumbnailHeight: json["thumbnailHeight"],
        thumbnailWidth: json["thumbnailWidth"],
        base64Encoding: json["base64Encoding"],
        name: json["name"],
        title: json["title"],
        provider: Provider.fromJson(json["provider"]),
        imageWebSearchUrl: json["imageWebSearchUrl"],
        webpageUrl: json["webpageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
        "thumbnail": thumbnail,
        "thumbnailHeight": thumbnailHeight,
        "thumbnailWidth": thumbnailWidth,
        "base64Encoding": base64Encoding,
        "name": name,
        "title": title,
        "provider": provider!.toJson(),
        "imageWebSearchUrl": imageWebSearchUrl,
        "webpageUrl": webpageUrl,
      };
}

class Provider {
  Provider({
    this.name,
    this.favIcon,
    this.favIconBase64Encoding,
  });

  String? name;
  String? favIcon;
  String? favIconBase64Encoding;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        name: json["name"],
        favIcon: json["favIcon"],
        favIconBase64Encoding: json["favIconBase64Encoding"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "favIcon": favIcon,
        "favIconBase64Encoding": favIconBase64Encoding,
      };
}
