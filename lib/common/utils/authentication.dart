import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/global.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存 token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重新登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
//  Navigator.pushNamedAndRemoveUntil(
//      context, "/log-in", (Route<dynamic> route) => false);
  Navigator.pushNamed(context, Routes.signInPageRoute);
}
