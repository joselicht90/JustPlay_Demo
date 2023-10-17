part of 'auth_page_cubit.dart';

sealed class AuthPageState extends Equatable {
  final GlobalKey<FormBuilderState> loginForm;
  final GlobalKey<FormBuilderState> signUpForm;
  const AuthPageState({required this.loginForm, required this.signUpForm});

  @override
  List<Object> get props => [loginForm, signUpForm];
}

class AuthScreenInitial extends AuthPageState {
  const AuthScreenInitial({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SigninIn extends AuthPageState {
  const SigninIn({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SigninUp extends AuthPageState {
  const SigninUp({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignInSuccess extends SigninIn {
  const SignInSuccess({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignUpSuccess extends SigninUp {
  const SignUpSuccess({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignInError extends SigninIn {
  final dynamic error;

  const SignInError({
    required this.error,
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignUpError extends SigninUp {
  final dynamic error;

  const SignUpError({
    required this.error,
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignInRequested extends SigninIn {
  const SignInRequested({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}

class SignUpRequested extends SigninUp {
  const SignUpRequested({
    required GlobalKey<FormBuilderState> loginForm,
    required GlobalKey<FormBuilderState> signUpForm,
  }) : super(
          loginForm: loginForm,
          signUpForm: signUpForm,
        );
}
