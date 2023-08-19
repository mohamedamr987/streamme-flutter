import 'package:flutter/material.dart';
import 'package:streamme/core/validation/email_validation.dart';
import 'package:streamme/widgets/auth_text_field.dart';

import '../../constants.dart';
import '../controller.dart';

class SignUpTextFieldsComponent extends StatelessWidget {
  const SignUpTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageController blocController = SignUpPageController.of(context);
    return Column(
      children: [
        AuthTextField(
          keyboardType: TextInputType.text,
          textController: blocController.firstNameController,
          labelText: "First name",
        ),
        const SizedBox(height: 20,),
        AuthTextField(
          keyboardType: TextInputType.text,
          textController: blocController.lastNameController,
          labelText: "Last name",
        ),
        const SizedBox(height: 20,),
        AuthTextField(
          keyboardType: TextInputType.emailAddress,
          textController: blocController.emailController,
          labelText: "Email",
          validation: (value) => !isEmail(value!) ? "Invalid Email" : null,
          suffix: const Icon(Icons.email_outlined, color: kIconColor,),
        ),
        const SizedBox(height: 20,),
        AuthTextField(
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          textController: blocController.passwordController,
          labelText: "Password",
        ),
        const SizedBox(height: 20,),
        AuthTextField(
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          textController: blocController.confirmPasswordController,
          labelText: "Confirm password",
          validation: (value) => value != blocController.passwordController.text ? "Password not match" : null,
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
