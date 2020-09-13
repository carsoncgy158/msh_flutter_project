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
      {String objectId, String className}) async {
    LCQuery<LCObject> query = LCQuery(className);
    LCObject obj = await query.get(objectId);
    return obj;
  }

  /// 通过 userid 和 会议的 confid 来检查是否已经注册会议，没有注册就注册，否则返回flase
  static Future<dynamic> regConfer({
    String conferObjId,
    String userId,
    String email = '',
    String phone = '',
    String name = '',
    String qq = '',
    String role = '',
    String genger = '',
    String note = '',
  }) async {
    LCQuery<LCObject> queryCheck = LCQuery('confUserMap');
    queryCheck.whereEqualTo('confId', '$conferObjId');
    queryCheck.whereEqualTo('userId', '$userId');
    List<LCObject> resCheck = await queryCheck.find();
    print('ssss');
    print(resCheck.length);
    if (resCheck.length != 0) {
      // 如果已经有这个报名信息，那么就通知用户已经报名。
      return false;
    } else {
      // 否则，报名，即插入数据
      LCObject ob = LCObject('confUserMap');
      ob['confId'] = conferObjId;
      ob['userId'] = userId;
      ob['email'] = email;
      ob['phone'] = phone;
      ob['name_zh'] = name;
      ob['qq'] = qq;
      ob['role'] = role;
      ob['genger'] = genger;
      ob['note'] = note;
      var resSave = await ob.save();
      print('检测报名是否成功${resSave}');
      return true;
    }
  }

  /// 通过用户的objid得到用户注册的会议信息
  static Future<List<LCObject>> getMyConf({String userId}) async {
    LCQuery<LCObject> queryCheck = LCQuery('confUserMap');
    queryCheck.whereEqualTo('userId', '$userId');
    List<LCObject> resCheck = await queryCheck.find();
    return resCheck;
  }

  /// 获取所有文章内容
  static Future<List<LCObject>> getAllPost() async {
    LCQuery<LCObject> query = LCQuery('post');

    query.whereEqualTo('draft', false);
    query.orderByDescending('createdAt');

    List<LCObject> res = await query.find();
    print('in api');
    // print(res[0]['tags'].toString());
    return res;
  }
}
