// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'route_page.dart';

class _$RoutePage extends RootStackRouter {
  _$RoutePage([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreenPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    NewStoreFormRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewStoreFormPage());
    },
    PosWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PosWrapperPage());
    },
    PosRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PosPage());
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: WrappedRoute(child: const CartPage()));
    },
    CartItemDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CartItemDetailRouteArgs>(
          orElse: () =>
              CartItemDetailRouteArgs(indexItem: pathParams.getInt('index')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WrappedRoute(
              child: CartItemDetailPage(
                  key: args.key, indexItem: args.indexItem)));
    },
    ResumeOrderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ResumeOrderPage());
    },
    PaymentCashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PaymentCashPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashScreenRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: 'login'),
        RouteConfig(RegisterRoute.name, path: 'register'),
        RouteConfig(NewStoreFormRoute.name, path: 'new/store/form'),
        RouteConfig(PosWrapperRoute.name, path: 'pos/', children: [
          RouteConfig('#redirect',
              path: '',
              parent: PosWrapperRoute.name,
              redirectTo: 'pos/product',
              fullMatch: true),
          RouteConfig(PosRoute.name,
              path: 'pos/product', parent: PosWrapperRoute.name),
          RouteConfig(CartRoute.name,
              path: 'pos/cart', parent: PosWrapperRoute.name),
          RouteConfig(CartItemDetailRoute.name,
              path: 'pos/cart/edit/:index', parent: PosWrapperRoute.name),
          RouteConfig(ResumeOrderRoute.name,
              path: 'pos/order/resume', parent: PosWrapperRoute.name),
          RouteConfig(PaymentCashRoute.name,
              path: 'pos/payment/cash', parent: PosWrapperRoute.name)
        ])
      ];
}

/// generated route for
/// [SplashScreenPage]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [NewStoreFormPage]
class NewStoreFormRoute extends PageRouteInfo<void> {
  const NewStoreFormRoute()
      : super(NewStoreFormRoute.name, path: 'new/store/form');

  static const String name = 'NewStoreFormRoute';
}

/// generated route for
/// [PosWrapperPage]
class PosWrapperRoute extends PageRouteInfo<void> {
  const PosWrapperRoute({List<PageRouteInfo>? children})
      : super(PosWrapperRoute.name, path: 'pos/', initialChildren: children);

  static const String name = 'PosWrapperRoute';
}

/// generated route for
/// [PosPage]
class PosRoute extends PageRouteInfo<void> {
  const PosRoute() : super(PosRoute.name, path: 'pos/product');

  static const String name = 'PosRoute';
}

/// generated route for
/// [CartPage]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: 'pos/cart');

  static const String name = 'CartRoute';
}

/// generated route for
/// [CartItemDetailPage]
class CartItemDetailRoute extends PageRouteInfo<CartItemDetailRouteArgs> {
  CartItemDetailRoute({Key? key, required int indexItem})
      : super(CartItemDetailRoute.name,
            path: 'pos/cart/edit/:index',
            args: CartItemDetailRouteArgs(key: key, indexItem: indexItem),
            rawPathParams: {'index': indexItem});

  static const String name = 'CartItemDetailRoute';
}

class CartItemDetailRouteArgs {
  const CartItemDetailRouteArgs({this.key, required this.indexItem});

  final Key? key;

  final int indexItem;

  @override
  String toString() {
    return 'CartItemDetailRouteArgs{key: $key, indexItem: $indexItem}';
  }
}

/// generated route for
/// [ResumeOrderPage]
class ResumeOrderRoute extends PageRouteInfo<void> {
  const ResumeOrderRoute()
      : super(ResumeOrderRoute.name, path: 'pos/order/resume');

  static const String name = 'ResumeOrderRoute';
}

/// generated route for
/// [PaymentCashPage]
class PaymentCashRoute extends PageRouteInfo<void> {
  const PaymentCashRoute()
      : super(PaymentCashRoute.name, path: 'pos/payment/cash');

  static const String name = 'PaymentCashRoute';
}