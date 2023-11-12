// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counterofferv1/contoroler/extension.dart';
import 'package:counterofferv1/src/screen/setting/account.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:counterofferv1/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

// ConsumerWidgetでProviderから値を受け渡す
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final User user = ref.watch(userProvider.notifier).state!;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
                "Setting",
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            Text(
                '${user.email}',
                style: const TextStyle(color: Colors.white, fontSize: 14.0),
              ),
            ]
          ),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.to(const accountSetting());
                },
                child: const Text('Account')
            ),
          ],
        ),
      ),
    );
  }
}