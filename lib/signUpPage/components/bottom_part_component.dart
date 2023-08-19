import 'package:flutter/material.dart';
import 'package:streamme/widgets/general_button.dart';

import '../controller.dart';

class BottomPartComponent extends StatelessWidget {
  const BottomPartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageController blocController = SignUpPageController.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralButton(text: "Sign up", onPressed: blocController.signUpRequest,),

      ],
    );
  }
}
