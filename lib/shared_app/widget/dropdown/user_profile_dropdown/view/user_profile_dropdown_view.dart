import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UserProfileDropdownField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(dynamic, dynamic, dynamic) onChanged;
  final dynamic validator;

  const UserProfileDropdownField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamList(
      future: UserProfileService().getAll(),
      itemsBuilder: (items) {
        return QDropdownField(
          label: label,
          validator: validator,
          items: items.map((e) {
            var item = UserProfile.fromJson(e);
            return {
              "label": item.userProfileName,
              "value": item.id,
              "object_value": e,
            };
          }).toList(),
          value: value,
          onChanged: (value, label) {
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
