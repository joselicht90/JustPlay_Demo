// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/user.dart';
import 'package:just_play_demo/data/repositories/auth_repository.dart';

//This is a global bloc because it has to be accessible from anywhere in the app
@singleton
class AuthCubit extends Cubit<User?> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(null);

  User? get user => _authRepository.currentUser();

  void setUser(User? user) {
    emit(user);
  }

  Future<void> logOut() async {
    await _authRepository.logout();
    emit(null);
  }
}
