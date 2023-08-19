import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/models/user_model.dart';

import 'repo.dart';

class ProfileRepo extends Repository {
  Future<void> getProfile() async{
    if(!CoreInfo.isLogged()){
      return;
    }
    Map<String, dynamic> data = _getCachedUser();
    CoreInfo.loggedUser = UserModel.fromJson(data);
  }
  Map<String, dynamic> _getCachedUser() {
    return Map<String, dynamic>.from(Hive.box("user").get("userJson",));
  }
  Future<void> cacheUserJson(Map<String, dynamic> json,) async {
    await Hive.box("user").put("userJson",json,);
  }

  Map<String, dynamic> getUserAfterSignUp() {
    return Map<String, dynamic>.from(Hive.box("user").get("userAfterSignUp",));
  }
  Future<void> cacheUserAfterSignUp(Map<String, dynamic> json,) async {
    await Hive.box("user").put("userAfterSignUp",json,);
  }

}