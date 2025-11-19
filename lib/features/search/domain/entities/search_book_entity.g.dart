// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchBookEntityAdapter extends TypeAdapter<SearchBookEntity> {
  @override
  final int typeId = 1;

  @override
  SearchBookEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchBookEntity(
      bookID: fields[0] as String,
      bookImage: fields[1] as String?,
      bookTitle: fields[2] as String,
      bookAuthor: fields[3] as String?,
      bookRating: fields[4] as num?,
      bookPrice: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SearchBookEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bookID)
      ..writeByte(1)
      ..write(obj.bookImage)
      ..writeByte(2)
      ..write(obj.bookTitle)
      ..writeByte(3)
      ..write(obj.bookAuthor)
      ..writeByte(4)
      ..write(obj.bookRating)
      ..writeByte(5)
      ..write(obj.bookPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchBookEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
