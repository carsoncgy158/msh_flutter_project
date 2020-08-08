import 'package:leancloud_storage/leancloud.dart';
import 'package:mshmobile/common/values/values.dart';

class LeanCloudLogin {
  static String _appID = LEANCLOUD_APP_ID;
  static String _appKey = LEANCLOUD_APP_KEY;
  static String _server = LEANCLOUD_SERVER_URL;

  static LeanCloudLogin _instance = LeanCloudLogin._();
  factory LeanCloudLogin() => _instance;
  LeanCloudLogin._();

  static Future<void> init() async {
    LeanCloud.initialize(_appID, _appKey,
        server: _server, queryCache: new LCQueryCache());
    print('leancloud connected');
  }

  Future signUp(String username, String email, String password) async {
    LCUser user = LCUser();

    user.username = username;
    user.email = email;
    user.password = password;
    try {
      await user.signUp();
    } catch (e) {
      print('${e.code} : ${e.message}');
    }
    print('sign up success');
    return 'sign up success';
  }

  Future login(String username, String password) async {
    print(username);
    print(password);
    LCUser user = await LCUser.login(username, password);
    print('log in success');
    return 'log in success';
  }

  Future getCurrentUser() async {
    LCUser currentUser = await LCUser.getCurrent();
    return currentUser;
  }
}
