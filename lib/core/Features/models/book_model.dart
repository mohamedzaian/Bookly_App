// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

import 'package:bookly/core/Features/entitys/book_entity.dart';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel  extends BookEntity{
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;

  BookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  }) : super(title: volumeInfo.title, image: volumeInfo.imageLinks.thumbnail, author: volumeInfo.authors.first , id: id , price: 0);

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json["kind"] ?? '',
    id: json["id"] ?? '',
    etag: json["etag"] ?? '',
    selfLink: json["selfLink"] ?? '',
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"] ?? {}),
    saleInfo: json["saleInfo"] != null ? SaleInfo.fromJson(json["saleInfo"]) : SaleInfo(country: '', saleability: '', isEbook: false),
    accessInfo: AccessInfo.fromJson(json["accessInfo"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "id": id,
    "etag": etag,
    "selfLink": selfLink,
    "volumeInfo": volumeInfo.toJson(),
    "saleInfo": saleInfo.toJson(),
    "accessInfo": accessInfo.toJson(),
  };
}

class AccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json["country"] ?? '',
    viewability: json["viewability"] ?? '',
    embeddable: json["embeddable"] ?? false,
    publicDomain: json["publicDomain"] ?? false,
    textToSpeechPermission: json["textToSpeechPermission"] ?? '',
    epub: Epub.fromJson(json["epub"]),
    pdf: Epub.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    accessViewStatus: json["accessViewStatus"],
    quoteSharingAllowed: json["quoteSharingAllowed"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "viewability": viewability,
    "embeddable": embeddable,
    "publicDomain": publicDomain,
    "textToSpeechPermission": textToSpeechPermission,
    "epub": epub.toJson(),
    "pdf": pdf.toJson(),
    "webReaderLink": webReaderLink,
    "accessViewStatus": accessViewStatus,
    "quoteSharingAllowed": quoteSharingAllowed,
  };
}

class Epub {
  bool isAvailable;
  String acsTokenLink;

  Epub({
    required this.isAvailable,
    required this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json["isAvailable"] ?? false,
    acsTokenLink: json["acsTokenLink"] ?? '123',
  );

  Map<String, dynamic> toJson() => {
    "isAvailable": isAvailable,
    "acsTokenLink": acsTokenLink,
  };
}

class SaleInfo {
  String country;
  String saleability;
  bool isEbook;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json["country"],
    saleability: json["saleability"],
    isEbook: json["isEbook"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "saleability": saleability,
    "isEbook": isEbook,
  };
}

class VolumeInfo {
  String title;
  String subtitle;
  List<String> authors;
  String publisher;
  DateTime publishedDate;
  String description;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    var publishedDate = json["publishedDate"];
    DateTime parsedDate;
    try {
      parsedDate = DateTime.parse(publishedDate);
    } catch (e) {
      parsedDate = DateTime.now(); // Use current date as fallback
    }

    return VolumeInfo(
      title: json["title"] ?? "",
      subtitle: json["subtitle"] ?? "",
      authors: List<String>.from(json["authors"] ?? []),
      publisher: json["publisher"] ?? "",
      publishedDate: parsedDate,
      description: json["description"] ?? "",
      industryIdentifiers: List<IndustryIdentifier>.from((json["industryIdentifiers"] ?? []).map((x) => IndustryIdentifier.fromJson(x))),
      readingModes: ReadingModes.fromJson(json["readingModes"] ?? {}),
      pageCount: json["pageCount"] ?? 0,
      printType: json["printType"] ?? "",
      categories: List<String>.from(json["categories"] ?? []),
      maturityRating: json["maturityRating"] ?? "",
      allowAnonLogging: json["allowAnonLogging"] ?? false,
      contentVersion: json["contentVersion"] ?? "",
      panelizationSummary: PanelizationSummary.fromJson(json["panelizationSummary"] ?? {}),
      imageLinks: ImageLinks.fromJson(json["imageLinks"] ?? {}),
      language: json["language"] ?? "",
      previewLink: json["previewLink"] ?? "",
      infoLink: json["infoLink"] ?? "",
      canonicalVolumeLink: json["canonicalVolumeLink"] ?? "",
    );

  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "authors": List<dynamic>.from(authors.map((x) => x)),
    "publisher": publisher,
    "publishedDate": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
    "description": description,
    "industryIdentifiers": List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
    "readingModes": readingModes.toJson(),
    "pageCount": pageCount,
    "printType": printType,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "maturityRating": maturityRating,
    "allowAnonLogging": allowAnonLogging,
    "contentVersion": contentVersion,
    "panelizationSummary": panelizationSummary.toJson(),
    "imageLinks": imageLinks.toJson(),
    "language": language,
    "previewLink": previewLink,
    "infoLink": infoLink,
    "canonicalVolumeLink": canonicalVolumeLink,
  };
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
    smallThumbnail: json["smallThumbnail"] ?? '',
    thumbnail: json["thumbnail"] ?? 'null',
  );

  Map<String, dynamic> toJson() => {
    "smallThumbnail": smallThumbnail,
    "thumbnail": thumbnail,
  };
}

class IndustryIdentifier {
  String type;
  String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
    type: json["type"],
    identifier: json["identifier"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "identifier": identifier,
  };
}

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
    containsEpubBubbles: json["containsEpubBubbles"] ?? false,
    containsImageBubbles: json["containsImageBubbles"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "containsEpubBubbles": containsEpubBubbles,
    "containsImageBubbles": containsImageBubbles,
  };
}

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({
    required this.text,
    required this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
    text: json["text"] ?? false,
    image: json["image"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
  };
}
