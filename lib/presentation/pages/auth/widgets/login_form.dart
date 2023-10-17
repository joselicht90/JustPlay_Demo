import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play_demo/presentation/pages/auth/cubit/auth_page_cubit.dart';
import 'package:just_play_demo/presentation/shared/inputs/jp_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthPageCubit>();

    return BlocBuilder<AuthPageCubit, AuthPageState>(
      builder: (context, state) {
        return FormBuilder(
          key: state.loginForm,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              JPFormTextField(
                name: 'email',
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              JPFormTextField(
                name: 'password',
                label: 'Password',
                obscureText: true,
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.required(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    authCubit.signInWithEmailAndPassword();
                  },
                  child: const Text('Sign In'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
