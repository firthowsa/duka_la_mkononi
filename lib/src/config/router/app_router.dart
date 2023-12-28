import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/products/views/product_details.dart';
import '../../presentation/products/views/products_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductView();
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'SavedArticlesView',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const SavedArticlesView();
        //   },
        // ),

        GoRoute(
            path: 'ProductDetailsView',
            builder:(BuildContext context, GoRouterState state) => ProductDetailsView(product: state.extra as Product)

        ),
      ],
    ),
  ],
);