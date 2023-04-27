import 'package:flutter/material.dart';
import 'package:riverpod_exmple/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exmple/logger_riverpod.dart';
import 'package:riverpod_exmple/user.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

@riverpod
String name(NameRef ref) {
  return 'Volkov';
}
//Пhовайдер написанный руками, выше провайдер сегенрированный ривропд генерацией
// final nameProvdier = Provider((ref) => 'Volkov');

@riverpod
Future<User> fetchUser(FetchUserRef ref, String userId) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(userId);
}
// Провайдер написанный в ручную, без паrета риверпод генерациии
// final fetchUserProvider =
//     FutureProvider.autoDispose.family((ref, String userId) {
//   final userRepository = ref.watch(userRepositoreyProvider);
//   return userRepository.fetchUserData(userId);
// }, name: 'Future User Provider');

void main() {
  runApp(ProviderScope(observers: [
    LoggerRiverpod(),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
