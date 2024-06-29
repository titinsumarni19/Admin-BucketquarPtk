import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class SidebarMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? view;
  final Function? onTap;
  SidebarMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.view,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = MainNavigationController.instance.mainView.toString() ==
        view.toString();

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        if (view != null) {
          MainNavigationController.instance.updateView(view!);
        }
      },
      hoverColor: Color(0xffebebeb),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24.0,
              // color: Color(0xffc3c5c9),
              color: Colors.white,
            ),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            if (false)
              Icon(
                Icons.chevron_right,
                size: 24.0,
                color: Color(0xffbdc5d5),
              ),
          ],
        ),
      ),
    );
  }
}
