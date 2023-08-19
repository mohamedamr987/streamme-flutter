import 'package:dartz/dartz.dart';
import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/errors/failures.dart';
import 'package:streamme/core/repo/repo.dart';

class LoginInRepo extends Repository {
  Future<Either<Failure, void>> loginIn(String email, String password) async {
    return await exceptionHandler(
      () async {
        Map<String, dynamic> result = await dioHelper.postDataWithoutToken("users/login", {
          "email": email,
          "password" : password
        },);
        await CoreInfo.handleAuthJson(result,);
        return;
      },
    );
  }
}
