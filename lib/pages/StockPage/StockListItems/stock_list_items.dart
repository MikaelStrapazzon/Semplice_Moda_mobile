import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:semplice_moda_mobile/types/api/stock/stock_item.dart';

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
      case 'roupa':
        itemIcon = FontAwesomeIcons.shirt;
        break;
      case 'sapato':
        itemIcon = FontAwesomeIcons.socks;
        break;
      case 'acessorio':
        itemIcon = FontAwesomeIcons.glasses;
        break;
      default:
        itemIcon = Icons.help_outline;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                color: item.selected ? const Color(0xFF6750A4) : Colors.grey,
              ),
            ),
            const SizedBox(width: 4),
            Center(
              child: Icon(
                itemIcon,
                size: 24,
                color: const Color(0xFF6750A4),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.id} - ${item.name}',
                    style: const TextStyle(
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
