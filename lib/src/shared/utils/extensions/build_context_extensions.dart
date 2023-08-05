import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TabBarTheme get tabBarTheme => Theme.of(this).tabBarTheme;
  CheckboxThemeData get checkboxTheme => Theme.of(this).checkboxTheme;
  RadioThemeData get radioTheme => Theme.of(this).radioTheme;
  ListTileThemeData get listTileTheme => Theme.of(this).listTileTheme;
  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      Theme.of(this).floatingActionButtonTheme;
  InputDecorationTheme get inputDecorationTheme =>
      Theme.of(this).inputDecorationTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      Theme.of(this).bottomNavigationBarTheme;
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;
  DialogTheme get dialogTheme => Theme.of(this).dialogTheme;
  SnackBarThemeData get snackBarTheme => Theme.of(this).snackBarTheme;
  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;
  CardTheme get cardTheme => Theme.of(this).cardTheme;

  FocusScopeNode get focusScope => FocusScope.of(this);

  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) {
    FocusScope.of(this).unfocus();
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  StackRouter get watchRouter => AutoRouter.of(this, watch: true);

  void popNative<T extends Object>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popForced<T extends Object>([T? result]) {
    AutoRouter.of(this).popForced(result);
  }

  void popUntil({required bool Function(Route<dynamic>) predicate}) {
    AutoRouter.of(this).popUntil(predicate);
  }

  Future<bool> pop<T extends Object>([T? result]) async =>
      AutoRouter.of(this).pop(result);

  Future<T?> push<T extends Object>(PageRouteInfo<dynamic> route,
          {void Function(NavigationFailure)? onFailure}) =>
      AutoRouter.of(this).push(route, onFailure: onFailure);

  Future<T?> pushReplacement<T extends Object?>(PageRouteInfo<dynamic> route,
          {void Function(NavigationFailure)? onFailure}) =>
      AutoRouter.of(this).replace(route, onFailure: onFailure);

  Future<T?> pushAndPopUntil<T extends Object?>(
    PageRouteInfo<dynamic> route, {
    required bool Function(Route<dynamic>) predicate,
    void Function(NavigationFailure)? onFailure,
  }) =>
      AutoRouter.of(this)
          .pushAndPopUntil(route, predicate: predicate, onFailure: onFailure);
}
