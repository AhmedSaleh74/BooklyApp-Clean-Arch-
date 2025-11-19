import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_providers.dart';
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
      providers: getAppBlocProviders(),
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
