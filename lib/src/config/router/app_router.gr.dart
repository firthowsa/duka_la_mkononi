// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:duka_la_mkononi/src/domain/models/product.dart' as _i6;
import 'package:duka_la_mkononi/src/presentation/products/views/product_details.dart'
    as _i1;
import 'package:duka_la_mkononi/src/presentation/products/views/products_view.dart'
    as _i2;
import 'package:duka_la_mkononi/src/presentation/testing.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProductDetailsView.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsViewArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ProductDetailsView(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ProductView(),
      );
    },
    RouteA.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ScreenA(),
      );
    },
  };
}

/// generated route for
/// [_i1.ProductDetailsView]
class ProductDetailsView extends _i4.PageRouteInfo<ProductDetailsViewArgs> {
  ProductDetailsView({
    _i5.Key? key,
    required _i6.Product product,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductDetailsView.name,
          args: ProductDetailsViewArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsView';

  static const _i4.PageInfo<ProductDetailsViewArgs> page =
      _i4.PageInfo<ProductDetailsViewArgs>(name);
}

class ProductDetailsViewArgs {
  const ProductDetailsViewArgs({
    this.key,
    required this.product,
  });

  final _i5.Key? key;

  final _i6.Product product;

  @override
  String toString() {
    return 'ProductDetailsViewArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i2.ProductView]
class ProductView extends _i4.PageRouteInfo<void> {
  const ProductView({List<_i4.PageRouteInfo>? children})
      : super(
          ProductView.name,
          initialChildren: children,
        );

  static const String name = 'ProductView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ScreenA]
class RouteA extends _i4.PageRouteInfo<void> {
  const RouteA({List<_i4.PageRouteInfo>? children})
      : super(
          RouteA.name,
          initialChildren: children,
        );

  static const String name = 'RouteA';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
