import 'package:flutter/material.dart';
import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import 'bottom_part_component.dart';
import 'sign_up_text_fields_component.dart';
import 'sign_up_title_component.dart';

class SignUpPageScaffold extends StatelessWidget {
  const SignUpPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageController blocController = SignUpPageController.of(context);
    return MainLayoutWidget(
      extendBodyBehindAppBar: true,
      widget: Form(
        key: blocController.formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignUpTitleComponent(),
            SignUpTextFieldsComponent(),
            BottomPartComponent(),
          ],
        ),
      ),
    );
  }
}
