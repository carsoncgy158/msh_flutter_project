import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/pages/account/account.dart';
import 'package:mshmobile/pages/article/article.dart';
import 'package:mshmobile/pages/conference/conference.dart';
import 'package:mshmobile/pages/event/event.dart';
import 'package:mshmobile/pages/mypage/mypage.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = [
    '文章',
    '会议',
    '社交',
    '我的模联',
    '账号',
  ];

  final List<String> _tabValuesAccount = ['模联ID', '我的信息'];
  final List<String> _tabValuesSocial = ['聊天', '社交网络'];

  TabController _tabControllerAccount;
  TabController _tabControllerSocial;

  // 页控制器
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.text_fields,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.text_fields,
        color: Colors.black,
      ),
      title: Text('文章'),
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.event,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.event,
        color: Colors.black,
      ),
      title: Text('会议'),
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.menu,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text('社交'),
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.info,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.info,
        color: Colors.black,
      ),
      title: Text('我的模联'),
      backgroundColor: Colors.transparent,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.account_circle,
        color: Colors.black,
      ),
      title: Text('账号'),
      backgroundColor: Colors.transparent,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  // 添加appbar的bottom
  TabBar _getAppbarBottom(String title) {
    if (title == '账号') {
      return TabBar(
        tabs: _tabValuesAccount
            .map((e) => Text(
                  e,
                  style: TextStyle(color: Colors.black),
                ))
            .toList(),
        controller: _tabControllerAccount,
        isScrollable: true,
      );
    } else if (title == '社交') {
      return TabBar(
        tabs: _tabValuesSocial
            .map((e) => Text(
                  e,
                  style: TextStyle(color: Colors.black),
                ))
            .toList(),
        controller: _tabControllerSocial,
        isScrollable: true,
      );
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
    _tabControllerAccount = TabController(
        length: _tabValuesAccount.length, vsync: ScrollableState());

    _tabControllerSocial = TabController(
        length: _tabValuesSocial.length, vsync: ScrollableState());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: (18.0),
          fontWeight: FontWeight.w600,
        ),
      ),
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
            Icons.search,
            color: AppColors.primaryText,
          ),
          onPressed: () {},
        ),
      ],
      bottom: _getAppbarBottom(_tabTitles[_page]),
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ArticlePage(),
        ConferencePage(),
        EventPage(
          tabValues: _tabValuesSocial,
          tabController: _tabControllerSocial,
        ),
        MyPage(),
        AccountPage(
          tabValues: _tabValuesAccount,
          tabController: _tabControllerAccount,
        ),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
