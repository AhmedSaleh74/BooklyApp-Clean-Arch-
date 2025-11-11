import 'package:bookly/features/home/domain/entities/book_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
         bookID: id ?? 'no_id', // قيمة افتراضية لو null
         bookImage: volumeInfo?.imageLinks?.thumbnail ?? '',
         bookTitle: volumeInfo?.title ?? 'No Title',
         bookAuthor:
             (volumeInfo?.authors?.isNotEmpty ?? false)
                 ? volumeInfo!.authors![0]
                 : 'Unknown',
         bookRating: volumeInfo?.averageRating ?? 0,
         bookPrice: saleInfo?.saleability ?? 'Free',
       );

  /// تحويل من JSON
  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo:
        json['volumeInfo'] != null
            ? VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>)
            : null,
    saleInfo:
        json['saleInfo'] != null
            ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
            : null,
    accessInfo:
        json['accessInfo'] != null
            ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
            : null,
    searchInfo:
        json['searchInfo'] != null
            ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
            : null,
  );

  /// تحويل Model → JSON
  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
    'searchInfo': searchInfo?.toJson(),
  };

  /// تحويل Model → Entity بطريقة آمنة
  BookEntity toEntity() {
    return BookEntity(
      bookID: id ?? 'no_id',
      bookImage: volumeInfo?.imageLinks?.thumbnail ?? '',
      bookTitle: volumeInfo?.title ?? 'No Title',
      bookAuthor:
          (volumeInfo?.authors?.isNotEmpty ?? false)
              ? volumeInfo!.authors![0]
              : 'Unknown',
      bookRating: volumeInfo?.averageRating ?? 0,
      bookPrice: saleInfo?.saleability ?? 'Free',
    );
  }
}
