import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/router/router.gr.dart';

import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/widgets/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mshmobile/global.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController =
      TextEditingController();

  String email;
  String password;
  String checkPassword;

  _handleSignup() async {
    Map<String, dynamic> params = {
      "email": _emailController.value.text,
      "password": AutoSHA256(_passwordController.value.text),
    };
    await UserAPI.userSignup(
      context: context,
      params: params,
    );
    UserLoginResponseEntity userProfile = await UserAPI.userLogin(
      context: context,
      params: params,
    );
    Global.saveProfile(userProfile);

    Navigator.pushNamed(context, Routes.applicationPageRoute);
  }

  Future<void> _showContract({String title, String content}) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$title'),
          titleTextStyle: TextStyle(),
          content: SingleChildScrollView(
            child: Html(data: content),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '同意',
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(
        top: AutoHeight(100),
      ),
      child: Text(
        "注册模时",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          fontSize: AutoFontSize(20),
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: AutoWidth(295),
      // height: 204,
      margin: EdgeInsets.only(top: (10)),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "请输入邮箱地址",
            marginTop: AutoHeight(20),
          ),
          // password input
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "请输入密码",
            marginTop: AutoHeight(20),
            isPassword: true,
          ),
          // password check
          inputTextEdit(
            controller: _checkPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "请确认密码",
            marginTop: AutoHeight(20),
            isPassword: true,
          ),

          // 同意协议和隐私政策
          Container(
            padding: EdgeInsets.only(top: AutoHeight(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '注册即代表同意',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: AutoFontSize(12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AutoHeight(2),
                  ),
                  child: InkWell(
                    highlightColor: AppColors.secondColor,
                    onTap: () {
                      /// TO DO
                      _showContract(title: '用户协议', content: contractStr);
                    },
                    child: Text(
                      '用户协议',
                      style: TextStyle(
                        fontSize: AutoFontSize(13),
                        fontStyle: FontStyle.italic,
                        color: AppColors.firstColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Text(
                  '与',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: AutoFontSize(12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: AutoWidth(2),
                  ),
                  child: InkWell(
                    onTap: () {
                      _showContract(title: '隐私政策', content: policyStr);
                    },
                    child: Text(
                      '隐私政策',
                      style: TextStyle(
                        fontSize: AutoFontSize(13),
                        fontStyle: FontStyle.italic,
                        color: AppColors.firstColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 注册按钮
          Container(
            height: AutoHeight(44),
            width: AutoWidth(295),
            margin: EdgeInsets.only(
              top: AutoHeight(25),
            ),
            child: FlatButton(
              color: AppColors.firstColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Text(
                '注册',
                style: TextStyle(
                  fontSize: AutoFontSize(17),
                  letterSpacing: AutoWidth(6),
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (!isEmail(_emailController.value.text)) {
                  toastInfo(msg: '请正确输入邮件');
                  return;
                }
                if (!checkStringLength(_passwordController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6位');
                  return;
                }
                if (password != checkPassword) {
                  toastInfo(msg: '两次密码输入需要一致');
                }
                _handleSignup();
              },
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }

// 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      width: 294,
      margin: EdgeInsets.only(bottom: AutoHeight(20)),
      child: FlatButton(
        child: Text(
          '已经有模时账号？立即登录',
          style: TextStyle(
            color: AppColors.firstColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, Routes.signInPageRoute);
        },
        color: AppColors.transparentColor,
        disabledColor: AppColors.thirdColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          child: Image(
            height: AutoHeight(120),
            image: AssetImage('assets/images/logo_white.png'),
            fit: BoxFit.cover,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: '用户注册界面');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.BackgroudColor,
        ),
        child: Column(
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
