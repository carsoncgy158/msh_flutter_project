import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';

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

    Navigator.pushNamed(
      context,
      "/app",
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: AutoHeight(80)),
      child: Text(
        "注册模时",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
          fontSize: AutoFontSize(20),
          height: 1,
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
          ),
          // password input
          inputTextEdit(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "请输入密码",
            isPassword: true,
          ),
          // password check
          inputTextEdit(
            controller: _checkPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "请确认密码",
            isPassword: true,
          ),

          // 同意协议
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('注册即代表同意'),
                FlatButton(
                  onPressed: () {
                    /// TO DO
                  },
                  child: Text(
                    '用户协议',
                    style: TextStyle(
                      fontSize: AutoFontSize(13),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Text('与'),
                FlatButton(
                  onPressed: () {
                    /// TO DO
                  },
                  child: Text(
                    '隐私政策',
                    style: TextStyle(
                      fontSize: AutoFontSize(13),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 注册按钮
          Container(
            height: AutoHeight(44),
            margin: EdgeInsets.only(top: AutoHeight(15)),
            child: btnFlatButtonWidget(
              width: AutoWidth(295),
              fontWeight: FontWeight.w600,
              title: "注册",
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
      margin: EdgeInsets.only(bottom: AutoHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {
          /// To do:
        },
        width: 294,
        color: AppColors.transparentColor,
        disabledColor: AppColors.thirdColor,
        fontColor: AppColors.primaryText,
        title: "已经有模时账号？立即登录",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  // 组织登录
  Widget _buildrOrgSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: AutoHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {
          /// To do:
        },
        width: 294,
        color: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "会议主办方和模联组织 注册",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(
//            Icons.arrow_back,
//            color: AppColors.primaryText,
//          ),
//          onPressed: () {
//            Navigator.pop(context);
//          },
//        ),
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
          color: Color(0xBDD8CA),
          image: DecorationImage(
            image: AssetImage("assets/images/signup.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            _buildHaveAccountButton(),
            _buildrOrgSignupButton(),
          ],
        ),
      ),
    );
  }
}
