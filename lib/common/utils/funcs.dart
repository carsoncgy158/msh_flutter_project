import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/widgets/toast.dart';

void clipBoardCopyInfo(
  String info,
  String remindStr, {
  @required BuildContext context,
}) {
  ClipboardManager.copyToClipBoard("$info").then(
    (result) {
      toastInfo(msg: '已经复制$remindStr到粘贴板');
    },
  );
}
