// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/global_blocs/auth_cubit.dart';
import 'package:just_play_demo/data/models/user.dart';
import 'package:just_play_demo/data/repositories/auth_repository.dart';

part 'auth_page_state.dart';

@lazySingleton
class AuthPageCubit extends Cubit<AuthPageState> {
  late GlobalKey<FormBuilderState> loginFormKey;
  late GlobalKey<FormBuilderState> signUpFormKey;
  final AuthRepository _authRepository;
  final AuthCubit _authCubit;

  AuthPageCubit(
    this._authRepository,
    this._authCubit,
  ) : super(AuthScreenInitial(
          signUpForm: GlobalKey<FormBuilderState>(),
          loginForm: GlobalKey<FormBuilderState>(),
        )) {
    loginFormKey = GlobalKey<FormBuilderState>();
    signUpFormKey = GlobalKey<FormBuilderState>();
    emit(SigninIn(loginForm: loginFormKey, signUpForm: signUpFormKey));
  }

  void setScreen({required bool isSigningUp}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (isSigningUp) {
      emit(SigninUp(signUpForm: signUpFormKey, loginForm: loginFormKey));
    } else {
      emit(SigninIn(signUpForm: signUpFormKey, loginForm: loginFormKey));
    }
  }

  void signInWithEmailAndPassword() async {
    emit(SignInRequested(loginForm: loginFormKey, signUpForm: signUpFormKey));
    try {
      bool isValid = loginFormKey.currentState?.validate() ?? false;

      if (isValid) {
        loginFormKey.currentState?.save();
        final email = loginFormKey.currentState?.fields['email']?.value;
        final password = loginFormKey.currentState?.fields['password']?.value;
        User? user =
            await _authRepository.signInWithEmailAndPassword(email, password);
        if (user != null) {
          _authCubit.setUser(user);
          emit(SignInSuccess(
            loginForm: loginFormKey,
            signUpForm: signUpFormKey,
          ));
        } else {
          throw Exception('User not found');
        }
      }
    } catch (e) {
      emit(SignInError(
          error: e, loginForm: loginFormKey, signUpForm: signUpFormKey));
    }
  }

  void signUpWithEmailAndPassword() async {
    emit(SignUpRequested(loginForm: loginFormKey, signUpForm: signUpFormKey));
    try {
      bool isValid = signUpFormKey.currentState?.validate() ?? false;

      if (isValid) {
        signUpFormKey.currentState?.save();
        final email = signUpFormKey.currentState?.fields['email']?.value;
        final password = signUpFormKey.currentState?.fields['password']?.value;
        final confirmPassword =
            signUpFormKey.currentState?.fields['confirm_password']?.value;

        if (password != confirmPassword) {
          throw Exception('Passwords do not match');
        }

        User? user =
            await _authRepository.signUpWithEmailAndPassword(email, password);

        if (user != null) {
          _authCubit.setUser(user);
          emit(SignUpSuccess(
            loginForm: loginFormKey,
            signUpForm: signUpFormKey,
          ));
        } else {
          throw Exception('User not found');
        }
      }
    } catch (e) {
      emit(SignUpError(
          error: e, loginForm: loginFormKey, signUpForm: signUpFormKey));
    }
  }
}
