import 'package:flutter_base/src/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppRouterProviders {
  static Provider<AppRouter> appRouterProvider = Provider((ref) => AppRouter());
}
