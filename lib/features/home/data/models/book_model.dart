// To parse this JSON data, do
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

import 'package:bookly/features/home/data/models/sale_info_model.dart';
import 'package:bookly/features/home/data/models/volume_info_model.dart';

import 'access_info_model.dart';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));
String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  final String kind;
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;

  BookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json["kind"],
    id: json["id"],
    etag: json["etag"],
    selfLink: json["selfLink"],
    volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
    saleInfo: SaleInfo.fromJson(json["saleInfo"]),
    accessInfo: AccessInfo.fromJson(json["accessInfo"]),
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
