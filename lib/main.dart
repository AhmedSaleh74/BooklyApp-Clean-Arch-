import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/domain/use_cases/get_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/get_newest_books_use_case.dart';
import '../../features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';
import '../../features/search/domain/use_cases/search_books_use_case.dart';
import '../../features/search/presentation/manager/search_book_cubit.dart';
import 'core/utils/functions/setup_service_locator.dart';
import 'core/utils/setup_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  setupServiceLocator();
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
          create:
              (_) => FeaturedBooksCubit(
                GetFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
              )..getFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (_) => NewestBooksCubit(
                GetNewestBooksUseCase(homeRepo: getIt.get<HomeRepoImp>()),
              )..getNewestBooks(),
        ),
        BlocProvider(
          create:
              (_) => SearchBookCubit(
                SearchBooksUseCase(searchRepo: getIt.get<SearchRepoImpl>()),
              ),
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
