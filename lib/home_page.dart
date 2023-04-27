import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exmple/main.dart';
import 'package:riverpod_exmple/user.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userId = '1';

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userId));
    return user.when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                userId = value;
                setState(() {});
              },
            ),
            Center(
              child: Text(data.name),
            ),
            Center(
              child: Text(data.email),
            ),
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
