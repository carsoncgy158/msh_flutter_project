import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/router/auth_grard.dart';

import 'package:mshmobile/pages/application/application.dart';
import 'package:mshmobile/pages/article/article.dart';
import 'package:mshmobile/pages/article/per_article.dart';
import 'package:mshmobile/pages/conference/conference.dart';
import 'package:mshmobile/pages/conference/per_conference.dart';
import 'package:mshmobile/pages/conference/register_conference.dart';

import 'package:mshmobile/pages/event/event.dart';
import 'package:mshmobile/pages/event/per_event.dart';
import 'package:mshmobile/pages/index/index.dart';
import 'package:mshmobile/pages/login/login.dart';
import 'package:mshmobile/pages/signup/signup.dart';
import 'package:mshmobile/pages/welcome/welcome.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $MshRouter {
  @initial
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  LoginPage signInPageRoute;

  SignupPage signUpPageRoute;

  ArticlePage articlePageRoute;
  PerArticlePage perArticlePageRoute;

  ConferencePage conferencePageRoute;
  PerConferencePage perConferencePage;
  RegConferencePage regConferencePage;

  EventPage eventPageRoute;
  PerEventPage perEventPage;

  @GuardedBy([AuthGuard])
  ApplicationPage applicationPageRoute;
}
