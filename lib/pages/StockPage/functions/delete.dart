import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semplice_moda_mobile/pages/StockPage/stock_page.dart';
import 'package:semplice_moda_mobile/types/api/stock/stock_item.dart';

void deleteItemStockFunction(
    BuildContext context, List<StockItem> selectedItems) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Deletion Confirmation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure you want to delete the following items?'),
            const SizedBox(height: 8),
            ...selectedItems.map((item) {
              return Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 6,
                  ),
                  const SizedBox(width: 8),
                  Text('${item.id} - ${item.name}'),
                ],
              );
            }).toList(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: const Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              http.post(
                  Uri.parse('http://192.168.0.112/SemplicePDM/delete.php'),
                  body: {
                    'ids': selectedItems
                        .map((item) => item.id.toString())
                        .toList()
                        .toString()
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
