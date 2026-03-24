// ignore_for_file: constant_identifier_names

import 'package:fruit_hub_dashboard/features/presentation/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String KDashboardhView = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KDashboardhView,
        builder: (context, state) => DashboardView(),
      ),
    ],
  );
}
