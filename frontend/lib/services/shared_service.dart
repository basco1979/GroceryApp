import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/models/login_response_model.dart';
import 'package:shop/api/api_service.dart';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class SharedService {
  static const String KEY_NAME = "login_key";
  static Future<bool> isLoggedIn() async {
    var isKeyExists = await APICacheManager().isAPICacheKeyExist(KEY_NAME);
    return isKeyExists;
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExists = await APICacheManager().isAPICacheKeyExist(KEY_NAME);
    if (isKeyExists) {
      var cacheData = await APICacheManager().getCacheData(KEY_NAME);
      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel =
        APICacheDBModel(key: KEY_NAME, syncData: jsonEncode(model.toJson()));
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(KEY_NAME);
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
