import 'package:counterofferv1/src/onesheet/home_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/colors/colors.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: CounterOffer()));
}

class CounterOffer extends StatelessWidget {
  const CounterOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
        title: 'CounterOffer',
        theme: ThemeData(
          // テーマカラー
            primarySwatch: primaryBlack
        ),
        // ホームページ表示
    home: const HomePage(),
    );
  }
}
