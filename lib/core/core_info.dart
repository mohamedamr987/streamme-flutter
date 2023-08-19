import 'package:hive_flutter/hive_flutter.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/loginInPage/login_in_page_view.dart';
import 'package:streamme/main.dart';

import 'models/user_model.dart';
import 'repo/bearer_token_repo.dart';
import 'repo/profile_repo.dart';

class CoreInfo{

  static BearerTokenRepo bearerTokenRepo = BearerTokenRepo();
  static UserModel? loggedUser;
  static bool get isAccountTesting{
    return loggedUser?.id == 146;
  }

  static Future<void> init() async {
    await ProfileRepo().getProfile();
    if(!isLogged()) return;

  }

  static bool isLogged(){
    return Hive.box("user").containsKey("userJson");
  }

  static Future<void> handleAuthJson(Map<String, dynamic> json) async {
    print(json);
    bearerTokenRepo.setBearerToken(json["token"]);
    loggedUser = UserModel.fromJson(json["data"]["user"]);
    await ProfileRepo().cacheUserJson(json["data"]["user"],);
  }

  static Future<void> logout() async {
    await Hive.box("user").clear();
    loggedUser = null;
    NavigationHelper.pushUntil(navigatorKey.currentContext!, const LoginInPageView());
  }
}