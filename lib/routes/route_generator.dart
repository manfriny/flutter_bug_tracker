import 'package:flutter/material.dart';
import 'package:flutter_bug_tracker/screens/home_screen.dart';
import 'package:flutter_bug_tracker/screens/new_issue_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case ('/new_issue'):
        return MaterialPageRoute(builder: (_) => const NewIssueScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorry! No Route was found!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    });
  }
}
