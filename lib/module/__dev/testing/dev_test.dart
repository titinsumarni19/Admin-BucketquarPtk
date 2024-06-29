// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DevTestView extends StatelessWidget {
  const DevTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomerListView();

    return Scaffold(
      appBar: AppBar(
        title: const Text("DevTestView"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  var items = await CustomerService().getAll();
                  print(items);
                },
                child: const Text("Get All"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
