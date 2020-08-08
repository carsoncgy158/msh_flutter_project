import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';

/// 全局配置
class Global {
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // leancloud 连接
    await LeanCloudLogin.init();
  }
}
