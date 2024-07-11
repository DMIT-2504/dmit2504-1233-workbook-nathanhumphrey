import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:week_05_nested_navigation/pages/settings/option1_page.dart';
import 'package:week_05_nested_navigation/pages/settings/option2_page.dart';
import 'package:week_05_nested_navigation/pages/settings/option3_page.dart';
import 'package:week_05_nested_navigation/pages/settings/routes.dart';
import 'package:week_05_nested_navigation/pages/settings/settings_page.dart';

class SettingsManager extends StatefulWidget {
  final String optionPageRoute;

  const SettingsManager({this.optionPageRoute = settingsHomeRoute, super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: _onGenerateRoute,
        initialRoute: widget.optionPageRoute,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('App Settings'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (_navigatorKey.currentState!.canPop()) {
            _navigatorKey.currentState!.pop();
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case settingsHomeRoute:
        page = const SettingsPage();
        break;
      case settingsOption1Route:
        page = const Option1Page();
        break;
      case settingsOption2Route:
        page = const Option2Page();
        break;
      case settingsOption3Route:
        page = const Option3Page();
        break;
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
