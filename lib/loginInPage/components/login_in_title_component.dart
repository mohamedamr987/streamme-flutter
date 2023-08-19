import 'package:flutter/material.dart';

import '../../widgets/general_text.dart';

class LoginInTitleComponent extends StatelessWidget {
  const LoginInTitleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40,),
        const GeneralText(text: "Welcome back", size: 28, fontWeight: FontWeight.w700, color: Color(0xFF445463),),
        const SizedBox(height: 30,),
      ],
    );
  }
}
