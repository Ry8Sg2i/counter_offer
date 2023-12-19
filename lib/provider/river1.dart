import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counterofferv1/model/user1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance.currentUser;
});

final firebaseAuthProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance;
});

final uidProvider = StateProvider.autoDispose((ref) {
  return FirebaseAuth.instance.currentUser?.uid ?? '';
});

// エラー情報の受け渡しを行うためのProvider
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  // パスワードのテキストを保存するProvider
  return TextEditingController(text: '');
});

// 名前の受け渡しを行うためのProvider
final userNameProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// emailの受け渡しを行うためのProvider
final userEmailProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

// githubidの受け渡しを行うためのProvider
final userGitProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final sentenceProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final fargotPasswordProvider = StateProvider.autoDispose((ref) {
  return '';
});

// StreamProviderを使うことでStreamも扱うことができる
final postsQueryProvider =
    StreamProvider.autoDispose<List<User1>>((ref) async* {
  final list = <User1>[];
  final response = FirebaseFirestore.instance
      .collection('User1')
      .orderBy('date')
      .snapshots();
  response.listen((collection) {
    for (final document in collection.docs) {
      final userData = User1.fromJson(document.data());
      list.add(userData);
    }
  });
  yield list;
});

final user1Provider = FutureProvider.autoDispose.family<User1, String>((ref, uid) async {
  final response = await FirebaseFirestore.instance
      .collection('User1')
      .doc(uid)
      .get();
  final userData = User1.fromJson(response.data()!);
  return userData;
});
