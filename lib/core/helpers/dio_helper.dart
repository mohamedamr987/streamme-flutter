import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/errors/exceptions.dart';

import '../repo/bearer_token_repo.dart';

class DioHelper
{
  static String baseUrl = "https://streamme-2wcx.onrender.com";
  static String api = "$baseUrl/api/v1";


  Dio dio = Dio(
    BaseOptions(
      headers: {
        "Accept": "application/json",
        'content-Type': 'application/json',
        "authorization": "Bearer ${BearerTokenRepo().getBearerToken()}"
      },
    ),
  );

  Future<dynamic> postDataWithoutToken(String parameter, dynamic data) async
  {
    final response = await dio.post('$api/$parameter',
        data: data ,
        options: Options(
          method: 'POST',
          validateStatus: (state) => state! < 500,
          // followRedirects: false,
          // validateStatus: (status) => true,
        )
    );
    return handleResponse(response);
  }

  Future<dynamic> postData(String parameter, dynamic data, {bool rawParameter = false}) async
  {
    print('$api/$parameter');
    print(data);
    print(dio.options.headers);
    final response = await dio.post( rawParameter ? parameter : '$api/$parameter',
        data: data,
        options: Options(
          contentType: 'application/json',
          method: 'POST',
          // validateStatus: (state) => state! < 500,
          followRedirects: false,
          validateStatus: (status) => true,
        ));
    return handleResponse(response);
  }

  Future<dynamic> putData(String parameter, Map<String, dynamic> data,) async
  {
    final response = await dio.put('$api/$parameter',
        data: json.encoder.convert(data),
        options: Options(
          contentType: 'application/json',
          method: 'PUT',
          validateStatus: (state) => state! < 500,
        ));
    return handleResponse(response);
  }

  Future<void> delData(String parameter,) async
  {

    final response = await dio.delete('$api/$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'DEL',
          validateStatus: (state) => state! < 500,
        ));
  }

  Future<Map<String,dynamic>> getDataWithoutToken(String parameter) async
  {
      Response response = await dio.get('$api/$parameter');
      return handleResponse(response);
  }

  Future<dynamic> getData(String parameter, {bool rawParameter = false}) async
  {
    log('$api/$parameter');
    print(dio.options.headers);
    Response response = await dio.get(rawParameter ? parameter : '$api/$parameter',
        options: Options(
          contentType: 'application/json',
          method: 'GET',
          followRedirects: false,
          validateStatus: (status) => true,
        )
    );
    return handleResponse(response);
  }

  dynamic handleResponse(Response response){
    // log(response.statusCode.toString());
    // log(response.data.toString());
    if(response.data is String) {
      response.data = Map.from(json.decode(response.data));
    }
    if(response.statusCode == 401){
      CoreInfo.logout();
    }
    if (response.statusCode.toString()[0] != "2" || response.data.containsKey("error")) {
      log(response.data.toString());
      throw ServerException(exceptionMessage: response.data["message"]?? response.data["error"],);
    }
    return response.data ;
  }

}
