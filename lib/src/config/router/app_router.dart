
import 'package:auto_route/auto_route.dart';

import  'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
     AutoRoute(page: ProductView.page,initial: true),
     AutoRoute(page: ProductDetailsView.page)
    // AutoRoute(page: SavedArticlesView.page)
  ];
}