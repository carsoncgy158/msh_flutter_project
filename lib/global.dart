import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    sessionToken: null,
  );

  static LeanCloudLogin leanCloud;

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 初始化
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // leancloud 连接
//    await LeanCloudLogin.init();

    // 本地缓存功能初始
    await StorageUtil.init();

    // http请求类初始化
    HttpUtil();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }
  }

  /// 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }
}
