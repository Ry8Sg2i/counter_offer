import 'package:counterofferv1/auth/fargot_password.dart';
import 'package:counterofferv1/auth/login_page.dart';
import 'package:counterofferv1/src/app.dart';
import 'package:counterofferv1/src/onesheet/home_page.dart';
import 'package:counterofferv1/src/screen/chat_page.dart';
import 'package:counterofferv1/src/screen/register/addPost_page.dart';
import 'package:counterofferv1/src/screen/register/my_page.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/account.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/deleteAccount_page.dart';
import 'package:counterofferv1/src/screen/setting/accoumt/logout_page.dart';
import 'package:counterofferv1/src/screen/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GlobalKeyを使用してボトムナビゲーションバーのWidgetにアクセスできるようにする.
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    /// ボトムナビゲーションバーとは違うルート.
    /// [ここから]
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
          ]
        ),
      ]
    ),
    /// [ここまで]
    // -----------------------------------------------------------------
    /// アプリケーションシェル
    /// この中にボトムナビゲーションバーする設定を書く.
    /// [ここから]
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// 下部のナビゲーションバーに最初に表示される画面.
        GoRoute(
          path: '/main',
          builder: (BuildContext context, GoRouterState state) {
            return const ChatPage();
          },
        ),

        /// 下のナビゲーションバーで2番目の項目が選択されたときに表示されます。
        /// 表示されます。
        GoRoute(
          path: '/account',
          builder: (BuildContext context, GoRouterState state) {
            return const MyPage();
          },
          routes: <RouteBase>[
            /// "/a/details "と同じですが、ルートNavigatorに表示させるために
            /// parentNavigatorKey]を指定することで、ルートNavigatorに表示されます。これは画面Bとアプリケーションシェルの両方をカバーします。
            /// アプリケーションシェルをカバーします。
            GoRoute(
              path: 'addaccount',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const AddPostPage();
              },
            ),
          ],
        ),

        /// 下部のナビゲーションバーに表示される3つ目の画面。
        GoRoute(
          path: '/setting',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingPage();
          },
          routes: <RouteBase>[
            // 内側のナビゲータに重ねて表示する詳細画面。
            // これは画面Aをカバーするが、アプリケーションシェルはカバーしない。
            GoRoute(
              path: 'accountsetting',
              builder: (BuildContext context, GoRouterState state) {
                return const accountSetting();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'logout',
                  builder: (BuildContext context, GoRouterState state) => const logoutSetting(),
                ),
                GoRoute(
                  path: 'deleteaccount',
                  builder: (BuildContext context, GoRouterState state) =>const deleteAccountSetting(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    /// [ここまで]
  ],
);