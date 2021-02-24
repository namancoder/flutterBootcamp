import 'package:sqlite_login/utils/network_util.dart';
import 'dart:async';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return null;
  }
}
