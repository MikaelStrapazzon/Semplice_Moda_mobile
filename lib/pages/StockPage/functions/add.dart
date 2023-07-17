import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semplice_moda_mobile/pages/StockPage/stock_page.dart';

void addItemStockFunction(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  String? selectedItem;

  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Add Item',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: sizeController,
                  decoration: const InputDecoration(
                    labelText: 'Size',
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a size';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: selectedItem,
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    selectedItem = value;
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'roupa',
                      child: Text('Clothing'),
                    ),
                    DropdownMenuItem(
                      value: 'sapato',
                      child: Text('Shoe'),
                    ),
                    DropdownMenuItem(
                      value: 'acessorio',
                      child: Text('Accessory'),
                    ),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a type';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: const Text(
              'Send',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }

              http.post(Uri.parse('http://192.168.0.112/SemplicePDM/add.php'),
                  body: {
                    'name': nameController.text,
                    'size': sizeController.text,
                    'type': selectedItem.toString()
                  }).then((value) {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const StockPage()),
                );
              });
            },
          ),
        ],
      );
    },
  );
}
