import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/sign_up_scaffold.dart';
import 'controller.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpPageController(),
      child: const SignUpPageScaffold(),
    );
  }
}
