import 'package:counterofferv1/compornents/appbar.dart';
import 'package:counterofferv1/model/user1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counterofferv1/provider/river1.dart';
import 'package:go_router/go_router.dart';

// ConsumerWidgetでProviderから値を受け渡す
class UserListPage extends ConsumerWidget {

  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final AsyncValue<List<User1>> asyncPostsQuery = ref.watch(postsQueryProvider);

    return Scaffold(
      appBar: const AppBarComponentWidget(
        title: "Userlist",
      ),
      body: Column(
        children: [
          Expanded(
            // StreamProviderから受け取った値は .when() で状態に応じて出し分けできる
            child: asyncPostsQuery.when(
              // 値が取得できたとき
              data: (query) {
                return ListView(
                  children: query.map((document) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.account_circle, color:Colors.black),
                        title: Text(document.name),
                        subtitle: Text(document.email),
                        onTap: () {
                          GoRouter.of(context).go('/main/anotheruser',extra: document);
                        },
                      ),
                    );
                  }).toList(),
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
          ),
        ],
      ),
    );
  }
}