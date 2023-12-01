// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:duka_la_mkononi/src/presentation/products/views/products_view.dart'
    as _i1;
import 'package:duka_la_mkononi/src/presentation/testing.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ProductView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ProductView(),
      );
    },
    RouteA.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ScreenA(),
      );
    },
  };
}

/// generated route for
/// [_i1.ProductView]
class ProductView extends _i3.PageRouteInfo<void> {
  const ProductView({List<_i3.PageRouteInfo>? children})
      : super(
          ProductView.name,
          initialChildren: children,
        );

  static const String name = 'ProductView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ScreenA]
class RouteA extends _i3.PageRouteInfo<void> {
  const RouteA({List<_i3.PageRouteInfo>? children})
      : super(
          RouteA.name,
          initialChildren: children,
        );

  static const String name = 'RouteA';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
