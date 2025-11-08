class ReadingModes {
  final bool text;
  final bool image;

  ReadingModes({required this.text, required this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      ReadingModes(text: json["text"], image: json["image"]);

  Map<String, dynamic> toJson() => {"text": text, "image": image};
}
