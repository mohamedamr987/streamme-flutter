import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/main.dart';
import 'package:streamme/widgets/error_alert_dialogue_widget.dart';
import 'package:streamme/widgets/show_loading.dart';
import '../allStreamsPage/all_streams_page_view.dart';
import '../constants.dart';
import 'repo/login_in_repo.dart';
import 'state.dart';

class LoginInPageController extends Cubit<LoginInPageState>
{
  LoginInPageController() :super(LoginInPageInit());
  static LoginInPageController of(context)=> BlocProvider.of(context);
  LoginInRepo loginInRepo = LoginInRepo();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void loginInRequest() async {
    if(formKey.currentState!.validate()){
      showLoading();
      final result = await loginInRepo.loginIn(emailController.text, passwordController.text,);
      hideLoading();
      result.fold(
            (l) => showErrorDialogue(l.message ?? kErrorText,),
            (r) => NavigationHelper.pushUntil(navigatorKey.currentContext!, const AllStreamsPageView(),)
      );
    }
  }


}