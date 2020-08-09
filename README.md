# 模时 移动端 flutter

## 运行方法
* flutter SDK和Dart SDK安装遵循[官网教程](https://flutterchina.club/get-started/install/)即可。

* 下载代码后，在android studio。mac端可以测试安卓emulator和苹果机simulator。windows只可以测试安卓emulator。
* 安卓emulator：
在android studio右上角，打开AVD manager，配置一个emulator。配置可参考下图，注意Graphics选项选Hardware。
![android studio](https://github.com/thindek/msh_mobile/blob/msh_mobile/android_emu.png)
## 项目文件结构
- assets
  - fonts
  - images

- lib
  - common
    - utils
    - values
    - widgets
  - pages
    - signup
    - app
  - main.dart
  - routes.dart
  - global.dart

* main.dart是项目执行的入口，在routes.dart定义好的路由(route)和在global.dart中定义的应用打开之前的一些初始化操作(比如和检查本地cookie，和数据库连接等操作)将会在main.dart中调用执行。之后根据路由设定进入到pages文件夹定义的界面当中。

* common中，utils存放各个前后端借口等文件，values存放各种静态常量，widgets存放经常使用的自己实现的widgets，比如某些按钮部件等等。