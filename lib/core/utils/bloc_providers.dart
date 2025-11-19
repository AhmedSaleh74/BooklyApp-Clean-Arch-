import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/domain/use_cases/get_featured_books_use_case.dart';
import '../../features/home/domain/use_cases/get_newest_books_use_case.dart';
import '../../features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import '../../features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';
import '../../features/search/domain/use_cases/search_books_use_case.dart';
import '../../features/search/presentation/manager/search_book_cubit.dart';
import 'functions/setup_service_locator.dart';

List<BlocProvider> getAppBlocProviders() {
  return [
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
  ];
}
