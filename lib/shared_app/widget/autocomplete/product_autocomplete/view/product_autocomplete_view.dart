import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductAutocompleteField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(dynamic, dynamic, dynamic) onChanged;
  final dynamic validator;
  final bool enabled;

  const ProductAutocompleteField({
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
      future: ProductService().getAll(),
      itemsBuilder: (items) {
        return QAutoComplete(
          label: label,
          validator: validator,
          enabled: enabled,
          items: items.map((e) {
            var item = Product.fromJson(e);
            return {
              "label": item.productName,
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
