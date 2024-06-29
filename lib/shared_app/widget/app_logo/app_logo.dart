import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class AppLogo extends StatelessWidget {
  final Color? color;
  const AppLogo({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        showLoading();
        await UserProfileService().deleteAll();
        hideLoading();
        ss("Delete all data success!");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                MdiIcons.cashRegister,
                size: 64.0,
                color: color ?? primaryColor,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AppName",
                  style: GoogleFonts.blackOpsOne(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: color ?? primaryColor,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -4, 0),
                  child: Text(
                    "Empowering Your Finances",
                    style: GoogleFonts.lato(
                      fontSize: 12.0,
                      color: color ?? primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
