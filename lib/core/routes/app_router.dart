import 'package:go_router/go_router.dart';

import '../../pages/home_page.dart';
import 'app_path.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: AppPath.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
