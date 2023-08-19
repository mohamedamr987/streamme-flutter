import 'package:flutter/material.dart';
import 'package:streamme/core/validation/email_validation.dart';
import 'package:streamme/widgets/auth_text_field.dart';

import '../../constants.dart';
import '../controller.dart';

class LoginInTextFieldsComponent extends StatelessWidget {
  const LoginInTextFieldsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginInPageController blocController = LoginInPageController.of(context);
    return Column(
      children: [
        AuthTextField(
          keyboardType: TextInputType.emailAddress,
          textController: blocController.emailController,
          labelText: "Enter your email",
          validation: (value) => !isEmail(value!) ? "Invalid Email" : null,
          suffix: const Icon(Icons.email_outlined, color: kIconColor,),
        ),
        const SizedBox(height: 20,),
        AuthTextField(
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          textController: blocController.passwordController,
          labelText: "Enter your password",
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
