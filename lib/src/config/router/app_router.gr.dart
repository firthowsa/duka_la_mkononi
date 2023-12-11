// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:duka_la_mkononi/src/presentation/products/views/products_view.dart'
    as _i1;
import 'package:duka_la_mkononi/src/presentation/products/views/remote_product_view.dart'
    as _i2;
import 'package:duka_la_mkononi/src/presentation/testing.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProductView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ProductView(),
      );
    },
    RemoteProductsView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RemoteProductsView(),
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
/// [_i1.ProductView]
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
/// [_i2.RemoteProductsView]
class RemoteProductsView extends _i4.PageRouteInfo<void> {
  const RemoteProductsView({List<_i4.PageRouteInfo>? children})
      : super(
          RemoteProductsView.name,
          initialChildren: children,
        );

  static const String name = 'RemoteProductsView';

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
