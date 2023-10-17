import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:just_play_demo/presentation/pages/auth/cubit/auth_page_cubit.dart';
import 'package:just_play_demo/presentation/shared/inputs/jp_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPageCubit, AuthPageState>(
      builder: (context, state) {
        final cubit = context.read<AuthPageCubit>();
        return FormBuilder(
          key: state.signUpForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(
                height: 20,
              ),
              JPFormTextField(
                name: 'confirm_password',
                label: 'Confirm Password',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    cubit.signUpWithEmailAndPassword();
                  },
                  child: const Text('Sign Up'),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
