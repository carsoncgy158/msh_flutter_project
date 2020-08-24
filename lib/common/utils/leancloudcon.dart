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
    LCLogger.setLevel(LCLogger.DebugLevel);

    print('leancloud connected');
  }

  static Future signUp(String username, String email, String password) async {
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

  static Future<dynamic> login(String email, String password) async {
    LCUser user = await LCUser.loginByEmail(email, password);
    print(user.sessionToken);
    print('log in success');
    return 'log in success';
  }

  static Future<dynamic> getCurrentUser() async {
    LCUser currentUser = await LCUser.getCurrent();
    return currentUser;
  }

  static Future<dynamic> getByObjectId(
      String objectId, String className) async {
    LCQuery<LCObject> query = LCQuery(className);
    LCObject obj = await query.get(objectId);
    return obj;
  }
}
