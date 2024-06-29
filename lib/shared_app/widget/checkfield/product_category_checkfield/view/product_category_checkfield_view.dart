import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductCategoryCheckField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(
    List ids,
    List labels,
    List objectValues,
  ) onChanged;
  final dynamic validator;

  const ProductCategoryCheckField({
    Key? key,
    required this.onChanged,
    required this.label,
    this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamList(
      future: ProductCategoryService().getAll(),
      itemsBuilder: (items) {
        return QCheckField(
          label: label,
          validator: validator,
          items: items.map((e) {
            var item = ProductCategory.fromJson(e);
            return {
              "label": item.productCategoryName,
              "value": item.id,
              "object_value": e,
            };
          }).toList(),
          value: value == null ? null : jsonDecode(value),
          onChanged: (value, label) {
            var ids = value.map((i) => i['value']).toList();
            var labels = value.map((i) => i['label']).toList();
            var mapValues = value.map((i) => i['object_value']).toList();
            onChanged(
              ids,
              labels,
              mapValues,
            );
          },
        );
      },
    );
  }
}
