import 'package:bookly/features/search/data/repositories/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/home/data/data_sources/home_local_data_source.dart';
import '../../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../../features/home/data/repositories/home_repo_impl.dart';
import '../../../features/search/data/data_sources/search_local_data_source.dart';
import '../../../features/search/data/data_sources/search_remote_data_source.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      searchLocalDataSource: SearchLocalDataSourceImpl(),
    ),
  );
}
