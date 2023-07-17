import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semplice_moda_mobile/components/appBars/DefaultAppBar/default_app_bar.dart';
import 'package:semplice_moda_mobile/components/buttons/ActionButton/action_button.dart';
import 'package:semplice_moda_mobile/components/floatingActionButtons/ExpandableFAB/expandable_fab.dart';
import 'package:semplice_moda_mobile/layouts/LoggedLayout/logged_layout.dart';
import 'package:semplice_moda_mobile/pages/StockPage/StockListItems/stock_list_items.dart';
import 'package:semplice_moda_mobile/pages/StockPage/functions/add.dart';
import 'package:semplice_moda_mobile/pages/StockPage/functions/delete.dart';
import 'package:semplice_moda_mobile/types/api/stock/stock_item.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  static String id = '/StockPage';

  @override
  State<StatefulWidget> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<StockItem> _listStockItems = [];

  Future<List<StockItem>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.112/SemplicePDM/list.php'));
    final data = jsonDecode(response.body) as List<dynamic>;
    final stockItems = data
        .map((item) => StockItem(
              id: int.parse(item['id']),
              name: item['name'],
              type: item['type'],
              size: item['size'],
            ))
        .toList();
    return stockItems;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        _listStockItems = data;
      });
    });
  }

  List<StockItem> selectedItems = [];

  void toggleItemSelection(StockItem item) {
    setState(() {
      item.selected = !item.selected;
      item.selected ? selectedItems.add(item) : selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(
      appBar: const DefaultAppBar(title: 'Stock'),
      body: ListView.builder(
        itemCount: _listStockItems.length,
        itemBuilder: (context, index) {
          StockItem item = _listStockItems[index];
          return StockListItem(
            item: item,
            onTap: () => toggleItemSelection(item),
          );
        },
      ),
      floatingActionButton: ExpandableFab(
        distance: 80,
        children: [
          ActionButton(
            onPressed: () => deleteItemStockFunction(context, selectedItems),
            icon: const Icon(Icons.delete_forever),
          ),
          ActionButton(
            onPressed: () => addItemStockFunction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
