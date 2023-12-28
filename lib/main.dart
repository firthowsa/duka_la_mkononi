import 'package:duka_la_mkononi/src/config/router/app_router.dart';
import 'package:duka_la_mkononi/src/config/themes/app_themes.dart';
import 'package:duka_la_mkononi/src/domain/repositories/api_repository.dart';
import 'package:duka_la_mkononi/src/locator.dart';
import 'package:duka_la_mkononi/src/presentation/products/cubits/remote_products/remote_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    //     BlocProvider(
    //       create: (context) => LocalArticlesCubit(
    //         locator<DatabaseRepository>(),
    //       )..getAllSavedArticles(),
    //     ),
    //
        BlocProvider(
          create: (context) => RemoteProductsCubit(
            locator<ApiRepository>(),
          )..getProducts(),
        )
      ],
      child :OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark
        ),
      ),
   );
  }
}