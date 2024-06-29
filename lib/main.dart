import 'package:hyper_ui/module/__dev/testing/dev_test.dart';
import 'package:hyper_ui/state_util.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

import 'dev_builder.dart';

// https://res.cloudinary.com/dotz74j1p/raw/upload/v1716046071/lav8q7oo72hn1kdbtggm.png
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Diointerceptors.init();
  await DBService.init();

  // await UserProfileService().deleteAll();

  // var users = await UserProfileService().getAll();
  // for (var user in users) {
  //   print(user["_id"] + " >> " + user["email"]);
  // }
  runMainApp();
}

runMainApp() async {
  return runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capek Ngoding',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme().copyWith(
        //----
        // scaffoldBackgroundColor: Colors.grey[200],
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: MainNavigationView(),
      // home: WebMainNavigationView(),
      // home: HuiViewListView(),
      home: isLoggedIn ? MainNavigationView() : LoginView(),
      // home: DevTestView(),
      onGenerateRoute: (routeSettings) {
        print(routeSettings.name);
        return null;
      },
      builder: (context, child) {
        return DevBuilder(
          child: child,
        );
      },
    );
  }
}
