import 'package:flutter/material.dart';

import '../../layouts/LoggedLayout/logged_layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static String id = '/DashboardPage';

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child:
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Dashboard'),

          ),
          body: const Text('Hello World'),
        )
    );
  }

}