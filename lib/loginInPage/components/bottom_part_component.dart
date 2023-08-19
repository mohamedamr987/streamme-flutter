import 'package:flutter/material.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/signUpPage/sign_up_page_view.dart';
import 'package:streamme/widgets/general_button.dart';

import '../controller.dart';

class BottomPartComponent extends StatelessWidget {
  const BottomPartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginInPageController blocController = LoginInPageController.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralButton(text: 'login', onPressed: blocController.loginInRequest,),
        GeneralButton(text: 'Sign up', onPressed: ()=> NavigationHelper.push(context, const SignUpPageView()), ),
      ],
    );
  }
}
