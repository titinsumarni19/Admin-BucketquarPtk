//#TEMPLATE reuseable_number_field
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:intl/intl.dart';

class QQtyField extends StatefulWidget {
  const QQtyField({
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.onSubmitted,
    this.pattern,
    this.locale = 'en_US',
    this.maxLength,
  });
  final String label;
  final int? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(int) onChanged;
  final Function(int)? onSubmitted;

  final String? pattern;
  final String? locale;
  final int? maxLength;

  @override
  State<QQtyField> createState() => _QQtyFieldState();
}

class _QQtyFieldState extends State<QQtyField> {
  int value = 0;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    value = widget.value ?? 0;
  }

  increment() {
    value++;
    setState(() {});

    widget.onChanged(value);
  }

  decrement() {
    if (value == 0) return;
    value--;
    setState(() {});
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 24,
            offset: Offset(0, 11),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => increment(),
            child: CircleAvatar(
              radius: 16.0,
              child: const Icon(
                Icons.add,
                size: 24.0,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$value",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: () => decrement(),
            child: CircleAvatar(
              radius: 16.0,
              child: const Icon(
                Icons.remove,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//#END
