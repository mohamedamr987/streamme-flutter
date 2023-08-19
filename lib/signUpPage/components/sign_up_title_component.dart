import 'package:flutter/material.dart';

import '../../widgets/general_text.dart';

class SignUpTitleComponent extends StatelessWidget {
  const SignUpTitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30,),
        GeneralText(text: "Create Account", size: 28, fontWeight: FontWeight.w700, color: Color(0xFF445463),),
        SizedBox(height: 10,),
        GeneralText(text: "Enter your info", ),
        SizedBox(height: 30,),
      ],
    );
  }
}
