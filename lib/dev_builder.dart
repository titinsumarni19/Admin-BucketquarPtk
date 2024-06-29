import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DevBuilder extends StatefulWidget {
  final Widget? child;
  const DevBuilder({
    super.key,
    this.child,
  });

  @override
  State<DevBuilder> createState() => DevBuilderState();
}

class DevBuilderState extends State<DevBuilder> {
  static late DevBuilderState instance;
  @override
  void initState() {
    super.initState();
    instance = this;
  }

  refresh() {
    setState(() {});
  }

  Widget devText(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Text(
        "$label",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget devAction(
    String text,
    String code, [
    String? customClass,
  ]) {
    return InkWell(
      onTap: () => viewCode(
        type: '$code',
        customClass: customClass,
      ),
      child: devText(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child!;
    return Column(
      children: [
        Expanded(
          child: widget.child!,
        ),
        Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: Row(
              children: [
                devText("USER:${currentUser?.id}"),
                devText("Role:${currentUser?.role}"),
                devText("isAdmin:${isAdmin}"),
                devAction("Env", "Env", "Env"),
                devAction("DB", "DevBuilder", "DevBuilder"),
                devAction("DMY", "DummyService", "DummyService"),
                devAction("V", "view"),
                devAction("C", "controller"),
                devAction("S", "service"),
                devAction("M", "model"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
