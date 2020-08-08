import 'package:flutter/material.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
      ),
      maxLines: 1,
      autocorrect: false, // 关闭自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
