import 'package:blog_app/screens/blogScreen.dart';
import 'package:blog_app/screens/homeScreen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/blog/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BlogDetailScreen(id: id);
      },
    ),
  ],
);
