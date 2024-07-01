import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'dashboard_statistic.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back, ${currentUser?.userProfileName}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  DashboardStatistic(
                    label: "Products",
                    icon: Icons.warehouse,
                    color: Colors.orange,
                    source: "product",
                  ),
                  DashboardStatistic(
                    label: "Product Categories",
                    icon: Icons.category,
                    color: Color(0xff409485),
                    source: "product_category",
                  ),
                  DashboardStatistic(
                    label: "Orders",
                    icon: Icons.sell,
                    color: Color(0xffc52323),
                    source: "order",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}

class WebDashboardSimpleStatistic extends StatelessWidget {
  final String label;
  final IconData icon;
  final double value;
  final double amount;
  final Color? color;

  WebDashboardSimpleStatistic({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.amount,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: (color ?? Color(0xff7974fe)).withOpacity(0.2),
          child: Icon(
            icon,
            color: color ?? Color(0xff7974fe),
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Text(
                    "${amount.currency}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                height: 12,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: LinearProgressIndicator(
                  value: value,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
