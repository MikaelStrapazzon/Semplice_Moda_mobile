import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semplice_moda_mobile/components/appBars/DefaultAppBar/default_app_bar.dart';

import '../../layouts/LoggedLayout/logged_layout.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static String id = '/DashboardPage';

  @override
  Widget build(BuildContext context) {
    return const LoggedLayout(
      appBar: DefaultAppBar(title: 'Dashboard'),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.toolbox,
                size: 80,
                color: Colors.red,
              ),
              SizedBox(height: 16),
              Text(
                'Página em Construção',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Desculpe-nos pelo incômodo. Esta página ainda está em construção.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
