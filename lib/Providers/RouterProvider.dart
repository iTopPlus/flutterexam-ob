import 'package:flutter/material.dart';
import 'package:project_it/Pages/Auth/CreateProfile.dart';
import 'package:project_it/Pages/Auth/SignInPage.dart';
import 'package:project_it/Pages/Auth/SignUp.dart';
import 'package:project_it/Pages/Chat/ChatDetail.dart';
import 'package:project_it/Pages/Chat/ChatPage.dart';
import 'package:project_it/Pages/FirstTime.dart';
import 'package:project_it/Pages/RouterPage.dart';
import 'package:project_it/main.dart';
import 'dart:collection';

class RouterProvider extends ChangeNotifier {
  static const String homeRoute = '/';
  static const String firstTimeRoute = '/FirstTime';
  static const String signInRoute = '/SignIn';
  static const String signUpRoute = '/SignUp';
  static const String createProfileRoute = '/CreateProfile';
  static const String groupRoute = '/Group';
  static const String chatPage = '/ChatPage';
  static const String chatDetail = '/ChatDetail';

  static final Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const Home(),
    firstTimeRoute: (context) => const FirstTimePage(),
    signInRoute: (context) => const SignInPage(),
    signUpRoute: (context) => const SignUpPage(),
    createProfileRoute: (context) => const CreateProfilePage(),
    groupRoute: (context) => const RouterPage(),
    chatPage: (context) => const ChatPage(),
    chatDetail: (context) => const ChatDetail()
  };

  final Map<String, dynamic> _defaultRoute = {
    'route': '/',
    'canPop': false,
    'showBBar': true,
    'backTo': null,
  };

  late Map<String, dynamic> _currentRoute;

  RouterProvider() {
    _currentRoute = Map.from(_defaultRoute);
  }

  Map<String, dynamic> get currentRoute => UnmodifiableMapView(_currentRoute);

  void changeRoute({
    required String newRoute,
    bool canPop = false,
    String? backTo,
    bool showBBar = true,
    Map<String, dynamic>? data,
  }) {
    if (_currentRoute['route'] != newRoute) {
      _currentRoute = {
        'route': newRoute,
        'canPop': canPop,
        'backTo': backTo,
        'showBBar': showBBar,
        'data': data,
      };

      notifyListeners();
    }
  }

  void reset() {
    _currentRoute = Map.from(_defaultRoute);
    notifyListeners();
  }
}
