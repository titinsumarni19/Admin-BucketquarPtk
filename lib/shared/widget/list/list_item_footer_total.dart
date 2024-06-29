import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/core.dart';

class ListItemFooterTotal extends StatelessWidget {
  const ListItemFooterTotal({
    required this.label,
    super.key,
    this.separator = true,
    this.value,
    this.onTap,
    this.color,
  });
  final String label;
  final String? value;
  final Function? onTap;
  final Color? color;
  final bool separator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: value ?? ''));
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      color: color,
                    ),
                  ),
                ),
                Text(
                  '$value',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: separator ? 1.0 : 0.0,
            color: disabledColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}