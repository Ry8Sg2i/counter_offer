import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:counterofferv1/auth/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ConsumerWidgetでProviderから値を受け渡す
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.greenAccent
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              await Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                    (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}