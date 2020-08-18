import 'package:auto_route/auto_route.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/utils/utils.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    var isAuth = await isAuthenticated();
    if (isAuth == false) {
      ExtendedNavigator.rootNavigator.pushNamed(Routes.signInPageRoute);
    }

    return isAuth;
  }
}
