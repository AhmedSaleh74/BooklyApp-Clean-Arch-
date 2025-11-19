import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:bookly/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/get_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/get_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/search/presentation/manager/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/functions/setup_service_locator.dart';
import 'features/search/data/repositories/search_repo_impl.dart';
import 'features/search/domain/entities/search_book_entity.dart';
import 'features/search/domain/use_cases/search_books_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة Hive للعمل مع Flutter
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<SearchBookEntity>(kSearchBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              GetFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
            )..getFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              GetNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
            )..getNewestBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return SearchBookCubit(
              SearchBooksUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
            )..searchBooks(query: 'C#');
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
