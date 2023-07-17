import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semplice_moda_mobile/components/appBars/DefaultAppBar/default_app_bar.dart';
import 'package:semplice_moda_mobile/components/buttons/ActionButton/action_button.dart';
import 'package:semplice_moda_mobile/components/floatingActionButtons/ExpandableFAB/expandable_fab.dart';
import 'package:semplice_moda_mobile/layouts/LoggedLayout/logged_layout.dart';

class StockItem {
  final String name;
  final String size;
  final String type;
  bool selected;

  StockItem({
    required this.name,
    required this.size,
    required this.type,
    this.selected = false,
  });
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

  List<StockItem> stockItems = [
    StockItem(name: "Camiseta", size: "M", type: "Roupa"),
    StockItem(name: "Calça Jeans", size: "42", type: "Roupa"),
    StockItem(name: "Sapato", size: "38", type: "Sapato"),
    StockItem(name: "Brinco", size: "U", type: "Acessório"),
  ];

  List<StockItem> selectedItems = [];

  void toggleItemSelection(StockItem item) {
    setState(() {
      item.selected = !item.selected;
      if (item.selected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  void deleteSelectedItems() {
    setState(() {
      stockItems.removeWhere((item) => item.selected);
      selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(
      appBar: const DefaultAppBar(title: 'Stock'),
      body: ListView.builder(
        itemCount: stockItems.length,
        itemBuilder: (context, index) {
          StockItem item = stockItems[index];
          return StockListItem(
            item: item,
            onTap: () => toggleItemSelection(item),
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
    );
  }
}

class StockListItem extends StatelessWidget {
  final StockItem item;
  final VoidCallback onTap;

  const StockListItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData itemIcon;
    switch (item.type) {
      case 'Roupa':
        itemIcon = FontAwesomeIcons.shirt;
        break;
      case 'Sapato':
        itemIcon = FontAwesomeIcons.socks;
        break;
      case 'Acessório':
        itemIcon = FontAwesomeIcons.glasses;
        break;
      default:
        itemIcon = Icons.help_outline;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: item.selected ? Colors.grey[300] : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onTap,
              icon: Icon(
                item.selected ? Icons.check_circle : Icons.circle_outlined,
                color: item.selected ? Color(0xFF6750A4) : Colors.grey,
              ),
            ),
            SizedBox(width: 4),
            Center(
              child: Icon(
                itemIcon,
                size: 24,
                color: Color(0xFF6750A4),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tamanho: ${item.size}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
