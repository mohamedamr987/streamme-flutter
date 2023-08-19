import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/login_in_scaffold.dart';
import 'controller.dart';

class LoginInPageView extends StatelessWidget {
  const LoginInPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginInPageController(),
      child: const LoginInPageScaffold(),
    );
  }
}
