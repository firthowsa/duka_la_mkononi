import 'package:duka_la_mkononi/src/domain/models/product.dart';
import 'package:duka_la_mkononi/src/presentation/carts/views/carts_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/on_boarding/onBoardingScreen.dart';
import '../../presentation/products/views/favorite_view.dart';
import '../../presentation/products/views/nav.dart';
import '../../presentation/products/views/product_details.dart';
import '../../presentation/products/views/products_view.dart';
import '../../presentation/profile/views/profile_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return  const ProductView();
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

        GoRoute(
            path: 'ProfileView',
            builder:(BuildContext context, GoRouterState state) => const ProfileView()

        ),


        GoRoute(
            path: 'CartsView',
            builder:(BuildContext context, GoRouterState state) => const CartsView()

        ),

        GoRoute(
            path: 'FavoritesView',
            builder:(BuildContext context, GoRouterState state) => const FavoritesView()

        ),

        GoRoute(
            path: 'ProfileScreen',
            builder:(BuildContext context, GoRouterState state) => const ProfileScreen()

        ),
      ],
    ),
  ],
);