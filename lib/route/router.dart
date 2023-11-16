import 'package:counterofferv1/auth/login_page.dart';
import 'package:counterofferv1/src/app.dart';
import 'package:counterofferv1/src/onesheet/home_page.dart';
import 'package:go_router/go_router.dart';

 
//ここに遷移させたい画面を全部入れていく
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: 'Home',
      path: '/',
      builder: (context, state) => const HomePage()
    ),
    GoRoute(
        name: 'Login',
        path: '/loginpage',
        builder: (context, state) => const LoginPage()
    ),
    GoRoute(
        name: 'bottombar',
        path: '/bottombar',
        builder: (context, state) => const MyStatefulWidget()
    ),
  ],
);