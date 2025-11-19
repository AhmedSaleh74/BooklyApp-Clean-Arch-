import 'package:hive_flutter/hive_flutter.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/search/domain/entities/search_book_entity.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(SearchBookEntityAdapter());

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<SearchBookEntity>(kSearchBox);
}
