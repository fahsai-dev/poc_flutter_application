import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class urlPages {
  static const home = '/';
  static const profilePage = '/ProfilePage';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // print current route for clarity.
    print('redirect >>> ${settings.name}');
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case urlPages.home:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case urlPages.profilePage:
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ProfilePage(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page'),
        ),
        body: Center(
          child: Text('not found.'),
        ),
      );
    });
  }
}
