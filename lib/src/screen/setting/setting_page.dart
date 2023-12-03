// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:counterofferv1/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ConsumerWidgetでProviderから値を受け渡す
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "Setting",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            ]
          ),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).go('/setting/accountsetting');
                  },
                  child: const Text('Account')
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}