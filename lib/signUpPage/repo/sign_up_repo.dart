import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/errors/failures.dart';
import 'package:streamme/core/repo/profile_repo.dart';
import 'package:streamme/core/repo/repo.dart';

class SignUpRepo extends Repository {
  Future<Either<Failure, void>> signUp(String firstName, String lastName, String email, String password) async {
    return await exceptionHandler(
      () async {
        Map<String, dynamic> result = await dioHelper.postDataWithoutToken("users/signup",{
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": password,
        },);
        await CoreInfo.handleAuthJson(result);
        return;
      },
    );
  }
}
