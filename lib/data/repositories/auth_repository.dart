import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/user.dart';
import 'package:just_play_demo/data/repositories/local_data_repository.dart';

@lazySingleton
class AuthRepository {
  final LocalDataRepository _localDataRepository;

  AuthRepository(this._localDataRepository);

  Future<bool> isUserAuthenticated() async {
    final currentUserJson =
        _localDataRepository.getValue(LocalDataRepositoryKeys.loggedUser);
    if (currentUserJson == null) {
      return false;
    }
    try {
      final currentUser = User.fromJson(jsonDecode(currentUserJson));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final newUser = User(
        displayName: email,
        email: email,
        firebaseUserId: 'abc123',
        id: 'abc123');

    await _localDataRepository.setValue(
      LocalDataRepositoryKeys.loggedUser,
      jsonEncode(newUser),
    );

    return newUser;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    final newUser = User(
        displayName: email,
        email: email,
        firebaseUserId: 'abc123',
        id: 'abc123');

    await _localDataRepository.setValue(
      LocalDataRepositoryKeys.loggedUser,
      jsonEncode(newUser),
    );

    return newUser;
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final newUser = User(
        displayName: email,
        email: email,
        firebaseUserId: 'abc123',
        id: 'abc123');

    await _localDataRepository.setValue(
      LocalDataRepositoryKeys.loggedUser,
      jsonEncode(newUser),
    );

    return newUser;
  }

  User? currentUser() {
    final currentUserJson =
        _localDataRepository.getValue(LocalDataRepositoryKeys.loggedUser);
    if (currentUserJson == null) {
      return null;
    }
    try {
      final currentUser = User.fromJson(jsonDecode(currentUserJson));
      return currentUser;
    } catch (e) {
      return null;
    }
  }
}
