import 'package:calculator/browser.dart';
import 'package:calculator/secretpage.dart';
import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:calculator/signup.dart';
import 'constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_SECRET_PAGE: (BuildContext context) => SecretPage(),
    Constants.ROUTE_MY_HOME_PAGE: (BuildContext context) => MyHomePage(),
    Constants.ROUTE_SIGN_UP_PAGE: (BuildContext context) => SignUpPage(),
    Constants.ROUTE_BROWSER_PAGE: (BuildContext context) => BrowserPage(),
  };
}
