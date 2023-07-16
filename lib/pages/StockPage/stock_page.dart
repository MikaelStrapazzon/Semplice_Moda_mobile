import 'package:flutter/material.dart';

import 'package:semplice_moda_mobile/layouts/LoggedLayout/logged_layout.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  static String id = '/StockPage';

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child:
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Stock'),

          ),
          body: const Text('Hello world'),
        )
    );
  }

}