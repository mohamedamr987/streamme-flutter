import 'package:flutter/material.dart';
import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'bottom_part_component.dart';
import 'login_in_text_fields_component.dart';
import 'login_in_title_component.dart';

class LoginInPageScaffold extends StatelessWidget {
  const LoginInPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginInPageController blocController = LoginInPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      widget: Form(
        key: blocController.formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginInTitleComponent(),
            LoginInTextFieldsComponent(),
            BottomPartComponent(),
          ],
        ),
      ),
    );
  }
}
