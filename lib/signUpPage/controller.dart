import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/main.dart';
import 'package:streamme/signUpPage/sign_up_page_view.dart';
import 'package:streamme/widgets/error_alert_dialogue_widget.dart';
import 'package:streamme/widgets/show_loading.dart';
import '../allStreamsPage/all_streams_page_view.dart';
import '../constants.dart';
import 'repo/sign_up_repo.dart';
import 'state.dart';

class SignUpPageController extends Cubit<SignUpPageState>
{
  SignUpPageController() :super(SignUpPageInit());
  static SignUpPageController of(context)=> BlocProvider.of(context);
  SignUpRepo signUpRepo = SignUpRepo();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signUpRequest() async {
    if(formKey.currentState!.validate()){
      showLoading();
      final result = await signUpRepo.signUp(firstNameController.text, lastNameController.text, emailController.text, passwordController.text,);
      hideLoading();
      result.fold(
            (l) => showErrorDialogue(l.message ?? kErrorText,),
            (r) => NavigationHelper.pushUntil(navigatorKey.currentContext!, const AllStreamsPageView(),)
      );
    }
  }


}