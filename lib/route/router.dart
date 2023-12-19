import 'package:counterofferv1/auth/fargot_password.dart';
import 'package:counterofferv1/auth/login_page.dart';
import 'package:counterofferv1/model/user1.dart';
import 'package:counterofferv1/src/app.dart';
import 'package:counterofferv1/src/onesheet/home_page.dart';
import 'package:counterofferv1/src/onesheet/newaccount.dart';
import 'package:counterofferv1/src/screen/userlist.dart';
import 'package:counterofferv1/src/screen/register/edituser.dart';
import 'package:counterofferv1/src/screen/register/otheruser.dart';
import 'package:counterofferv1/src/screen/register/my_page.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/account.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/deleteAccount_page.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/logout_page.dart';
import 'package:counterofferv1/src/screen/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
          routes: <RouteBase>[
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'fargotpass',
              builder: (BuildContext context, GoRouterState state) {
                return const FargotPassword();
              },
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'newaccount',
              builder: (BuildContext context, GoRouterState state) {
                return const NewAccount();
              },
            ),
          ]
        ),
      ]
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Navbar(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/main',
          builder: (BuildContext context, GoRouterState state) {
            return const UserListPage();
          },
          routes: <GoRoute>[
            GoRoute(
              path: 'anotheruser',
              builder: (BuildContext context, GoRouterState state) {
                return OtherUser(data: state.extra as User1);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/account',
          builder: (BuildContext context, GoRouterState state) {
            return const MyPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'addaccount',
              builder: (BuildContext context, GoRouterState state) {
                return const AddPostPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: '/setting',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'accountsetting',
              builder: (BuildContext context, GoRouterState state) {
                return const accountSetting();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'logout',
                  builder: (BuildContext context, GoRouterState state) {
                    return const logoutSetting();
                  },
                ),
                GoRoute(
                  path: 'deleteaccount',
                  builder: (BuildContext context, GoRouterState state) {
                    return const deleteAccountSetting();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);