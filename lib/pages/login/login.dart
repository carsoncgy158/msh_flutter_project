import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/router/router.gr.dart';

import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/widgets/widgets.dart';

import '../../global.dart';

class LoginPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email;
  String password;

  _handleLogin() async {
    Map<String, dynamic> params = {
      "email": _emailController.value.text,
      "password": AutoSHA256(_passwordController.value.text),
    };
    UserLoginResponseEntity userProfile = await UserAPI.userLogin(
      context: context,
      params: params,
    );
    Global.saveProfile(userProfile);
    Navigator.pushNamed(context, Routes.applicationPageRoute);
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(
        top: AutoHeight(100),
      ),
      child: Text(
        "登录模时",
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

  // 登录表单
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

          // 登录按钮
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
                '登录',
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
                _handleLogin();
//                Navigator.pop(context);
              },
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }

// 没有账号，去注册按钮
  Widget _buildHaveAccountButton() {
    return Container(
      width: 294,
      margin: EdgeInsets.only(top: AutoHeight(20)),
      child: FlatButton(
        onPressed: () {
          ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPageRoute);
        },
        color: AppColors.transparentColor,
        disabledColor: AppColors.thirdColor,
        child: Text(
          '还没有模时账号？立即注册',
          style: TextStyle(
            color: AppColors.firstColor,
            fontWeight: FontWeight.w700,
            fontSize: AutoFontSize(14),
          ),
        ),
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
              toastInfo(msg: '用户登录界面');
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
