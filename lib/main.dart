import 'package:flutter/material.dart';
import 'package:semplice_moda_mobile/pages/DashboardPage/dashboard_page.dart';
import 'package:semplice_moda_mobile/pages/LoginPage/login_page.dart';
import 'package:semplice_moda_mobile/pages/RegisterPage/register_page.dart';
import 'package:semplice_moda_mobile/pages/StockPage/stock_page.dart';
import 'package:semplice_moda_mobile/styles/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: true,
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        DashboardPage.id: (context) => const DashboardPage(),
        StockPage.id: (context) => const StockPage(),
      },
    );
  }
}
