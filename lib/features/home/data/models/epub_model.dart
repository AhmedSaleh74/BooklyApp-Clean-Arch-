class Epub {
  final bool isAvailable;

  Epub({required this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) =>
      Epub(isAvailable: json["isAvailable"]);

  Map<String, dynamic> toJson() => {"isAvailable": isAvailable};
}
