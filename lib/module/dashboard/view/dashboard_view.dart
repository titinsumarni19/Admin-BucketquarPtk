import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/dashboard/widget/transaction_card.dart';
import 'package:hyper_ui/module/dashboard/widget/transaction_chart.dart';
import 'package:hyper_ui/module/dashboard/widget/transaction_statistic_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
          child: const Column(
            children: [],
          ),
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Define breakpoints and corresponding crossAxisCounts
        int crossAxisCount = 1;
        if (width >= 900) {
          crossAxisCount = 4;
        } else if (width >= 600) {
          crossAxisCount = 3;
        } else if (width >= 400) {
          crossAxisCount = 2;
        }

        StaggeredGridTile gridTile(
          int crossAxisCellCount,
          double mainAxisCellCount,
          Widget? widget,
        ) {
          // Adjust the crossAxisCellCount based on the total number of columns
          if (crossAxisCellCount > crossAxisCount) {
            crossAxisCellCount =
                crossAxisCount; // Limit to the maximum number of columns
          }

          var width = MediaQuery.of(context).size.width;

          if (width >= 900) {
            mainAxisCellCount = mainAxisCellCount;
          } else if (width >= 600) {
            var size = 0.2;
            mainAxisCellCount = mainAxisCellCount + size;
          } else if (width >= 400) {
            var size = 0.3;
            mainAxisCellCount = mainAxisCellCount + size;
          }

          return StaggeredGridTile.count(
            crossAxisCellCount: crossAxisCellCount,
            mainAxisCellCount: mainAxisCellCount,
            child: Container(
              color: widget != null ? Colors.transparent : Colors.grey[300],
              child: widget,
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: StaggeredGrid.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  gridTile(
                    1,
                    0.40,
                    TransactionCard(
                      mode: "today",
                    ),
                  ),
                  gridTile(
                    1,
                    0.40,
                    TransactionCard(
                      mode: "this_week",
                    ),
                  ),
                  gridTile(
                    1,
                    0.40,
                    TransactionCard(
                      mode: "this_month",
                    ),
                  ),
                  gridTile(
                    1,
                    0.40,
                    TransactionCard(
                      mode: "this_year",
                    ),
                  ),
                  //----
                  gridTile(2, 1, TransactionChart()),
                  // gridTile(2, 1, TransactionLineChart()),
                  gridTile(2, 1, Container()),
                  gridTile(1, 1, Container()),
                  gridTile(1, 1, Container()),
                  gridTile(
                    2,
                    2,
                    Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: QCard(
                      title: "Revenue",
                      children: [
                        Builder(
                          builder: (context) {
                            final List<Map> chartData = [
                              {
                                "year": "Jan",
                                "sales": 4000,
                              },
                              {
                                "year": "Feb",
                                "sales": 9000,
                              },
                              {
                                "year": "Mar",
                                "sales": 3000,
                              },
                              {
                                "year": "Apr",
                                "sales": 8000,
                              },
                              {
                                "year": "May",
                                "sales": 9000,
                              }
                            ];
                            final List<Map> chartData2 = [
                              {
                                "year": "Jan",
                                "sales": 3000,
                              },
                              {
                                "year": "Feb",
                                "sales": 8000,
                              },
                              {
                                "year": "Mar",
                                "sales": 2000,
                              },
                              {
                                "year": "Apr",
                                "sales": 7000,
                              },
                              {
                                "year": "May",
                                "sales": 6000,
                              }
                            ];

                            return Container(
                              color: Theme.of(context).cardColor,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                  labelFormat: "{value}",
                                ),
                                legend: Legend(
                                  isVisible: true,
                                  alignment: ChartAlignment.near,
                                  offset: Offset(0, 0),
                                ),
                                series: <CartesianSeries>[
                                  // Renders line chart
                                  SplineSeries<Map, String>(
                                    name: "Income",
                                    color: Color(0xff1b55e2),
                                    dataSource: chartData,
                                    xValueMapper: (Map data, _) => data["year"],
                                    yValueMapper: (Map data, _) =>
                                        data["sales"],
                                  ),
                                  SplineSeries<Map, String>(
                                    name: "Expense",
                                    color: Color(0xffe7515a),
                                    dataSource: chartData2,
                                    xValueMapper: (Map data, _) => data["year"],
                                    yValueMapper: (Map data, _) =>
                                        data["sales"],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Sales by Category",
                      children: [
                        Builder(
                          builder: (context) {
                            final List<Map> chartData = [
                              {
                                "year": "Food",
                                "sales": 40,
                              },
                              {
                                "year": "Drink",
                                "sales": 90,
                              },
                              {
                                "year": "Salt",
                                "sales": 30,
                              },
                              {
                                "year": "Sugar",
                                "sales": 80,
                              },
                              {
                                "year": "Rice",
                                "sales": 90,
                              }
                            ];

                            return Container(
                              color: Theme.of(context).cardColor,
                              child: SfCircularChart(
                                legend: Legend(isVisible: true),
                                series: <CircularSeries>[
                                  PieSeries<Map, String>(
                                    dataSource: chartData,
                                    dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                    ),
                                    xValueMapper: (Map data, _) => data["year"],
                                    yValueMapper: (Map data, _) =>
                                        data["sales"],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Daily Sales",
                      children: [
                        Builder(
                          builder: (context) {
                            final List<Map> chartData = [
                              {
                                "year": "Mon",
                                "sales": 40,
                              },
                              {
                                "year": "Tue",
                                "sales": 90,
                              },
                              {
                                "year": "Wed",
                                "sales": 30,
                              },
                              {
                                "year": "Thu",
                                "sales": 80,
                              },
                              {
                                "year": "Fri",
                                "sales": 90,
                              },
                              {
                                "year": "Sat",
                                "sales": 120,
                              },
                              {
                                "year": "Sun",
                                "sales": 80,
                              }
                            ];
                            return Container(
                              color: Theme.of(context).cardColor,
                              child: SfCartesianChart(
                                isTransposed: true,
                                primaryXAxis: CategoryAxis(),
                                series: <CartesianSeries>[
                                  BarSeries<Map, String>(
                                    color: Color(0xffe2a03f),
                                    dataSource: chartData,
                                    xValueMapper: (Map data, _) => data["year"],
                                    yValueMapper: (Map data, _) =>
                                        data["sales"],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Today Sales",
                      children: [
                        Builder(
                          builder: (context) {
                            final List<Map> chartData = [
                              {
                                "year": "00:00 - 06:00",
                                "sales": 26,
                              },
                              {
                                "year": "06:00 - 12:00",
                                "sales": 14,
                              },
                              {
                                "year": "12:00 - 18:00",
                                "sales": 16,
                              },
                              {
                                "year": "18:00 - 00:00",
                                "sales": 10,
                              },
                            ];
                            return Container(
                              color: Theme.of(context).cardColor,
                              child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                series: <CartesianSeries>[
                                  BarSeries<Map, String>(
                                    color: Color(0xff315a74),
                                    dataSource: chartData,
                                    xValueMapper: (Map data, _) => data["year"],
                                    yValueMapper: (Map data, _) =>
                                        data["sales"],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Summary",
                      children: [
                        WebDashboardSimpleStatistic(
                          label: "Income",
                          icon: Icons.wallet,
                          value: 0.6,
                          amount: 2000,
                          color: Color(0xff7974fe),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        WebDashboardSimpleStatistic(
                          label: "Expense",
                          icon: Icons.wallet,
                          value: 0.5,
                          amount: 700,
                          color: Color(0xfff58130),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        WebDashboardSimpleStatistic(
                          label: "Tax",
                          icon: Icons.wallet,
                          value: 0.9,
                          amount: 500,
                          color: Color(0xff315a74),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        WebDashboardSimpleStatistic(
                          label: "Profit",
                          icon: Icons.wallet,
                          value: 0.9,
                          amount: 700,
                          color: Color(0xff26b07c),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Recent Activities",
                      children: [
                        Builder(builder: (context) {
                          List items = [
                            {
                              "color": Colors.green,
                              "label": "Create Order",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.blue,
                              "label": "Create Purchase Order",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.red,
                              "label": "Update Product",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.orange,
                              "label": "Stock Opname",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.purple,
                              "label": "Process Return",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.yellow,
                              "label": "Generate Invoice",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.pink,
                              "label": "Update Inventory",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.brown,
                              "label": "Customer Feedback",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.grey,
                              "label": "Schedule Delivery",
                              "time": randomDate,
                            },
                            {
                              "color": Colors.cyan,
                              "label": "Approve Payment",
                              "time": randomDate,
                            },
                          ];

                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var item = items[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: 8.0,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 4.0,
                                      backgroundColor: item["color"],
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        item["label"],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      (item["time"] as DateTime).dMMMykkmm,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Transactions",
                      children: [
                        Builder(builder: (context) {
                          List items = [
                            {
                              "label": "Cash withdrawal",
                              "user": "Tony",
                              "time": randomDate,
                              "image":
                                  "https://cdn-icons-png.flaticon.com/128/8358/8358757.png",
                              "amount": 145000,
                            },
                            {
                              "label": "Topup",
                              "user": "Jeremy",
                              "time": randomDate,
                              "image":
                                  "https://cdn-icons-png.flaticon.com/128/1790/1790213.png",
                              "amount": 230000,
                            },
                            {
                              "label": "Cash withdrawal",
                              "user": "Vine",
                              "time": randomDate,
                              "image":
                                  "https://cdn-icons-png.flaticon.com/128/8358/8358757.png",
                              "amount": 25000,
                            },
                            {
                              "label": "Cash withdrawal",
                              "user": "Jacob",
                              "time": randomDate,
                              "image":
                                  "https://cdn-icons-png.flaticon.com/128/8358/8358757.png",
                              "amount": 300000,
                            },
                            {
                              "label": "Topup",
                              "user": "Alex",
                              "time": randomDate,
                              "image":
                                  "https://cdn-icons-png.flaticon.com/128/1790/1790213.png",
                              "amount": 125000,
                            },
                          ];

                          return ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var item = items[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      item["image"],
                                      width: 32.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["label"],
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          Text(
                                            item["user"],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            (item["time"] as DateTime)
                                                .dMMMykkmm,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      "${item["amount"].toString().currency}",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: dangerColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: QCard(
                      title: "Top Selling Product",
                      children: [
                        Builder(builder: (context) {
                          List<Map<String, dynamic>> products = [
                            {
                              "id": 1,
                              "photo":
                                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045560/mq2o8cqtmvaobrnil7xi.png",
                              "product_name": "Frenzy Pizza",
                              "price": 3241,
                              "category": "Food",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 3241,
                              "is_favorite": false,
                            },
                            {
                              "id": 2,
                              "photo":
                                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045565/cvx59ia4kvqj2ratfkjs.png",
                              "product_name": "Beef Burger",
                              "price": 4190,
                              "category": "Food",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 4190,
                              "is_favorite": true,
                            },
                            {
                              "id": 3,
                              "photo":
                                  "https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                              "product_name": "Seperait",
                              "price": 2390,
                              "category": "Drink",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 2390,
                              "is_favorite": false,
                            },
                            {
                              "id": 4,
                              "photo":
                                  "https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                              "product_name": "Fried Rice",
                              "price": 4100,
                              "category": "Food",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 4100,
                              "is_favorite": true,
                            },
                            {
                              "id": 5,
                              "photo":
                                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045569/cpiafx7w5euet8dctcho.png",
                              "product_name": "Terrano Milk",
                              "price": 2300,
                              "category": "Drink",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 2300,
                              "is_favorite": true,
                            },
                            {
                              "id": 6,
                              "photo":
                                  "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                              "product_name": "Fried Chicken",
                              "price": 1500,
                              "category": "Food",
                              "description":
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                              "discount_price": 1500,
                              "is_favorite": false,
                            },
                          ];
                          return ListView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var item = products[index];
                              return ListTile(
                                contentPadding: EdgeInsets.all(0.0),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: NetworkImage(
                                    item["photo"],
                                  ),
                                ),
                                title: Text(item["product_name"]),
                                subtitle: Text(item["category"]),
                                trailing: Text(
                                  "${item["price"].toString().currency}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
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
