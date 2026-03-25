import 'package:fruit_hub_dashboard/features/addProduct/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dashboard/features/dashbord/presentation/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String KDashboardView = '/';
  static const String KAddProductView = '/addproductview';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: KDashboardView,
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(
        path: KAddProductView,
        builder: (context, state) => AddProductView(),
      ),
    ],
  );
}
