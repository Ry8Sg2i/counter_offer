// ignore_for_file: avoid_unnecessary_containers
import 'package:counterofferv1/src/screen/register/addPost_page.dart';
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
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Colors.blue,
                child: ListTile(
                  leading: const Icon(Icons.account_circle, color:Colors.white),
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

class Featured extends ConsumerWidget {
  const Featured({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final user1Data = ref.watch(user1Provider);


    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 32, left: 8),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Your Data',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  child: Column(
          // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
                    children: [
                      user1Data.when(data: (data) {
                        return ListTile(
                            leading: const Icon(Icons.email, color:Colors.black),
                            title: const Text("YourEmail"),
                            subtitle: Text(data["userEmail"]),
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
                      user1Data.when(data: (data) {
                        return ListTile(
                            leading: const Icon(Icons.account_box, color:Colors.black),
                            title: const Text("YourGithubID"),
                            subtitle: Text(data["GithubID"]),
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
                ),
              ),
            ),
          ],
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
            'Points of Appeal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
          children: [
            user1Data.when(data: (data) {
              return  Card(
                child: ExpansionTile(
                  leading: const Icon(Icons.description),
                  title: const Text("sentence"),
                  children: <Widget>[
                    ListTile(
                      title: Text(data["sentence"]),
                      ),
                  ],
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

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              children: [
                _Header(title: 'User'),
                User1State(),
                Featured(),
                User1List(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const AddPostPage();
            }),
          );
        },
      ),
    );
  }
}