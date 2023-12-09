import 'package:counterofferv1/colors/colors.dart';
import 'package:counterofferv1/route/router.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: CounterOffer()));
}

class CounterOffer extends ConsumerWidget {
  const CounterOffer({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // アプリ名
        title: 'CounterOffer',
        theme: ThemeData(
          // テーマカラー
          primarySwatch: primaryBlack,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
          ),
          
          canvasColor: Colors.white,
        ),
        routerConfig: goRouter,
    );
  }
}
