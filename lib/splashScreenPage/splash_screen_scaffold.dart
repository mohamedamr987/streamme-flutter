import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/loginInPage/login_in_page_view.dart';
import 'package:streamme/widgets/general_text.dart';


import '../allStreamsPage/all_streams_page_view.dart';
import '../main.dart';
import '../size_config.dart';

class SplashScreenScaffold extends StatefulWidget {
  const SplashScreenScaffold({Key? key}) : super(key: key);

  @override
  State<SplashScreenScaffold> createState() => _SplashScreenScaffoldState();
}

class _SplashScreenScaffoldState extends State<SplashScreenScaffold> {

  @override
  void initState() {
    super.initState();
    //this is the function which contains all the settings need to be done before starting the app
    delayingFunc();
  }
  void delayingFunc() async{

    try{
      await CoreInfo.init();
      await Future.delayed(const Duration(seconds: 2));
      NavigationHelper.pushUntil(navigatorKey.currentContext!, CoreInfo.isLogged() ? const AllStreamsPageView() :  const LoginInPageView(),);
    }
    catch(e, trace){
      log(e.toString());
      log(trace.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GeneralText(text: "Stream me", size: 40,)
      )
    );
  }
}
