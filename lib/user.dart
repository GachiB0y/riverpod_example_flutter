// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@immutable
class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], email: json['email']);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}

//Провайдер сгенерированый пакетом риверпод генерации
// final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData(String userId) async {
    var url = 'https://jsonplaceholder.typicode.com/users/${userId}';
    final dio = Dio();
    final response = await dio.get(url);
    return User.fromJson(response.data);
  }
}

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier() : super(User(name: '', age: 0));

//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }

//   void updateAge(int a) {
//     state = state.copyWith(age: a);
//   }
// }
