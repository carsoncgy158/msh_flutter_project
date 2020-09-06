// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mshmobile/pages/index/index.dart';
import 'package:mshmobile/pages/welcome/welcome.dart';
import 'package:mshmobile/pages/login/login.dart';
import 'package:mshmobile/pages/signup/signup.dart';
import 'package:mshmobile/pages/article/article.dart';
import 'package:mshmobile/pages/article/per_article.dart';
import 'package:mshmobile/common/entity/article.dart';
import 'package:mshmobile/pages/conference/conference.dart';
import 'package:mshmobile/pages/conference/per_conference.dart';
import 'package:mshmobile/common/entity/conference.dart';
import 'package:mshmobile/pages/conference/register_conference.dart';
import 'package:mshmobile/pages/event/event.dart';
import 'package:mshmobile/pages/event/per_event.dart';
import 'package:mshmobile/common/entity/event.dart';
import 'package:mshmobile/pages/application/application.dart';
import 'package:mshmobile/common/router/auth_grard.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePageRoute = '/welcome-page-route';
  static const signInPageRoute = '/sign-in-page-route';
  static const signUpPageRoute = '/sign-up-page-route';
  static const articlePageRoute = '/article-page-route';
  static const perArticlePageRoute = '/per-article-page-route';
  static const conferencePageRoute = '/conference-page-route';
  static const perConferencePage = '/per-conference-page';
  static const regConferencePage = '/reg-conference-page';
  static const eventPageRoute = '/event-page-route';
  static const perEventPage = '/per-event-page';
  static const applicationPageRoute = '/application-page-route';
  static const all = {
    indexPageRoute,
    welcomePageRoute,
    signInPageRoute,
    signUpPageRoute,
    articlePageRoute,
    perArticlePageRoute,
    conferencePageRoute,
    perConferencePage,
    regConferencePage,
    eventPageRoute,
    perEventPage,
    applicationPageRoute,
  };
}

class MshRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.applicationPageRoute: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<MshRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePageRoute:
        if (hasInvalidArgs<WelcomePageArguments>(args)) {
          return misTypedArgsRoute<WelcomePageArguments>(args);
        }
        final typedArgs =
            args as WelcomePageArguments ?? WelcomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomePage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signInPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginPage(),
          settings: settings,
        );
      case Routes.signUpPageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignupPage(),
          settings: settings,
        );
      case Routes.articlePageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ArticlePage(),
          settings: settings,
        );
      case Routes.perArticlePageRoute:
        if (hasInvalidArgs<PerArticlePageArguments>(args)) {
          return misTypedArgsRoute<PerArticlePageArguments>(args);
        }
        final typedArgs =
            args as PerArticlePageArguments ?? PerArticlePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              PerArticlePage(key: typedArgs.key, article: typedArgs.article),
          settings: settings,
        );
      case Routes.conferencePageRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ConferencePage(),
          settings: settings,
        );
      case Routes.perConferencePage:
        if (hasInvalidArgs<PerConferencePageArguments>(args)) {
          return misTypedArgsRoute<PerConferencePageArguments>(args);
        }
        final typedArgs =
            args as PerConferencePageArguments ?? PerConferencePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PerConferencePage(
              key: typedArgs.key, conference: typedArgs.conference),
          settings: settings,
        );
      case Routes.regConferencePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RegConferencePage(),
          settings: settings,
        );
      case Routes.eventPageRoute:
        if (hasInvalidArgs<EventPageArguments>(args)) {
          return misTypedArgsRoute<EventPageArguments>(args);
        }
        final typedArgs = args as EventPageArguments ?? EventPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => EventPage(
              key: typedArgs.key,
              tabValues: typedArgs.tabValues,
              tabController: typedArgs.tabController),
          settings: settings,
        );
      case Routes.perEventPage:
        if (hasInvalidArgs<PerEventPageArguments>(args)) {
          return misTypedArgsRoute<PerEventPageArguments>(args);
        }
        final typedArgs =
            args as PerEventPageArguments ?? PerEventPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              PerEventPage(key: typedArgs.key, event: typedArgs.event),
          settings: settings,
        );
      case Routes.applicationPageRoute:
        if (hasInvalidArgs<ApplicationPageArguments>(args)) {
          return misTypedArgsRoute<ApplicationPageArguments>(args);
        }
        final typedArgs =
            args as ApplicationPageArguments ?? ApplicationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ApplicationPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;
  IndexPageArguments({this.key});
}

//WelcomePage arguments holder class
class WelcomePageArguments {
  final Key key;
  WelcomePageArguments({this.key});
}

//PerArticlePage arguments holder class
class PerArticlePageArguments {
  final Key key;
  final ArticleResult article;
  PerArticlePageArguments({this.key, this.article});
}

//PerConferencePage arguments holder class
class PerConferencePageArguments {
  final Key key;
  final ConferenceResult conference;
  PerConferencePageArguments({this.key, this.conference});
}

//EventPage arguments holder class
class EventPageArguments {
  final Key key;
  final List<String> tabValues;
  final TabController tabController;
  EventPageArguments({this.key, this.tabValues, this.tabController});
}

//PerEventPage arguments holder class
class PerEventPageArguments {
  final Key key;
  final Result event;
  PerEventPageArguments({this.key, this.event});
}

//ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;
  ApplicationPageArguments({this.key});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension MshRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.indexPageRoute,
        arguments: IndexPageArguments(key: key),
      );

  Future pushWelcomePageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.welcomePageRoute,
        arguments: WelcomePageArguments(key: key),
      );

  Future pushSignInPageRoute() => pushNamed(Routes.signInPageRoute);

  Future pushSignUpPageRoute() => pushNamed(Routes.signUpPageRoute);

  Future pushArticlePageRoute() => pushNamed(Routes.articlePageRoute);

  Future pushPerArticlePageRoute({
    Key key,
    ArticleResult article,
  }) =>
      pushNamed(
        Routes.perArticlePageRoute,
        arguments: PerArticlePageArguments(key: key, article: article),
      );

  Future pushConferencePageRoute() => pushNamed(Routes.conferencePageRoute);

  Future pushPerConferencePage({
    Key key,
    ConferenceResult conference,
  }) =>
      pushNamed(
        Routes.perConferencePage,
        arguments: PerConferencePageArguments(key: key, conference: conference),
      );

  Future pushRegConferencePage() => pushNamed(Routes.regConferencePage);

  Future pushEventPageRoute({
    Key key,
    List<String> tabValues,
    TabController tabController,
  }) =>
      pushNamed(
        Routes.eventPageRoute,
        arguments: EventPageArguments(
            key: key, tabValues: tabValues, tabController: tabController),
      );

  Future pushPerEventPage({
    Key key,
    Result event,
  }) =>
      pushNamed(
        Routes.perEventPage,
        arguments: PerEventPageArguments(key: key, event: event),
      );

  Future pushApplicationPageRoute({Key key, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.applicationPageRoute,
        arguments: ApplicationPageArguments(key: key),
        onReject: onReject,
      );
}
