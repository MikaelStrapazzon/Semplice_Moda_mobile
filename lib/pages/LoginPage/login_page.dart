import 'package:flutter/material.dart';
import 'package:semplice_moda_mobile/pages/DashboardPage/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = '/LoginPage';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primaryContainer;
    Color secondaryColor = Theme.of(context).colorScheme.secondaryContainer;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: const [0.1, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )

        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.adb, size: 80),
            const Text('SempliceModa ERP'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage())),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}