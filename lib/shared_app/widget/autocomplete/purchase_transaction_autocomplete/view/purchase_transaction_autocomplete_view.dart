import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PurchaseTransactionAutocompleteField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(dynamic, dynamic, dynamic) onChanged;
  final dynamic validator;
  final bool enabled;

  const PurchaseTransactionAutocompleteField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.value,
    this.enabled = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamList(
      future: PurchaseTransactionService().getAll(),
      itemsBuilder: (items) {
        return QAutoComplete(
          label: label,
          validator: validator,
          enabled: enabled,
          items: items.map((e) {
            var item = PurchaseTransaction.fromJson(e);
            return {
              "label": item.id,
              "value": item.id,
              "object_value": e,
            };
          }).toList(),
          value: value,
          onChanged: (value, label) {
            if (value == null) {
              onChanged(
                null,
                null,
                null,
              );
              return;
            }

            var mapValue =
                items.firstWhere((element) => element['_id'] == value);
            onChanged(
              value,
              label,
              mapValue,
            );
          },
        );
      },
    );
  }
}
