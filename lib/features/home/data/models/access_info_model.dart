import 'epub_model.dart';

class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Epub pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

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
    country: json["country"],
    viewability: json["viewability"],
    embeddable: json["embeddable"],
    publicDomain: json["publicDomain"],
    textToSpeechPermission: json["textToSpeechPermission"],
    epub: Epub.fromJson(json["epub"]),
    pdf: Epub.fromJson(json["pdf"]),
    webReaderLink: json["webReaderLink"],
    accessViewStatus: json["accessViewStatus"],
    quoteSharingAllowed: json["quoteSharingAllowed"],
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
