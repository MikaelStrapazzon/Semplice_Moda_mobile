import 'package:flutter/material.dart';
import 'package:semplice_moda_mobile/components/buttons/ActionButton/ActionButton.dart';
import 'package:semplice_moda_mobile/components/floatingActionButtons/ExpandableFAB/ExpandableFAB.dart';
import 'package:semplice_moda_mobile/layouts/LoggedLayout/logged_layout.dart';

class Item {
  final String name;
  bool selected;

  Item({required this.name, this.selected = false});
}

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  static String id = '/StockPage';

  @override
  State<StatefulWidget> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  List<Item> items = [
    Item(name: 'Item 1'),
    Item(name: 'Item 2'),
    Item(name: 'Item 3'),
    Item(name: 'Item 4'),
    Item(name: 'Item 5'),
  ];

  List<Item> selectedItems = [];

  void toggleItemSelection(Item item) {
    setState(() {
      item.selected = !item.selected;
      if (item.selected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  void performAction(String action) {
    if (action == 'delete') {
      deleteSelectedItems();
    } else if (action == 'add') {
      // Implemente a lógica para adicionar um novo item aqui
    }
  }

  void deleteSelectedItems() {
    setState(() {
      items.removeWhere((item) => item.selected);
      selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Stock'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            leading: Checkbox(
              value: item.selected,
              onChanged: (value) => toggleItemSelection(item),
            ),
          );
        },
      ),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 2),
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    ));
  }
}
