import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';

class _Header extends StatelessWidget {
  final String title;

  const _Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class User1State extends ConsumerWidget {
  const User1State({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // ignore: unused_local_variable
    final User user = ref.watch(userProvider.notifier).state!;
    final user1Data = ref.watch(user1Provider);

    return Column(
      children: [
            user1Data.when(data: (data) {
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    color: Colors.blue,
                    child: ListTile(
                      title: const Text("YourName"),
                      subtitle: Text(data["name"]),
                      textColor: Colors.white,
                    ),
                  ),
                ),
              );
            },
              // 値が読込中のとき
              loading: () {
                return const Center(
                  child: Text('読込中...'),
                );
              },
              // 値の取得に失敗したとき
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              },
            ),
          ],
    );
  }
}

class User1List extends ConsumerWidget {
  const User1List({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // ignore: unused_local_variable
    final User user = ref.watch(userProvider.notifier).state!;
    final user1Data = ref.watch(user1Provider);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 32, bottom: 8, left: 8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
          children: [
            user1Data.when(data: (data) {
              return Card(
                child: ListTile(
                  title: const Text("YourEmail"),
                  subtitle: Text(data["email"]),
                ),
              );
            },
              // 値が読込中のとき
              loading: () {
                return const Center(
                  child: Text('読込中...'),
                );
              },
              // 値の取得に失敗したとき
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              },
            ),
          ],
        ),
        Column(
          // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
          children: [
            user1Data.when(data: (data) {
              return Card(
                child: ListTile(
                  title: const Text("YourGithubID"),
                  subtitle: Text(data["GithubID"]),
                ),
              );
            },
              // 値が読込中のとき
              loading: () {
                return const Center(
                  child: Text('読込中...'),
                );
              },
              // 値の取得に失敗したとき
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              children: [
                _Header(title: 'User'),
                User1State(),
                User1List(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}