import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DashboardStatistic extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String source;
  const DashboardStatistic({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.source,
  });

  @override
  State<DashboardStatistic> createState() => _DashboardStatisticState();
}

class _DashboardStatisticState extends State<DashboardStatistic> {
  bool loading = true;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    loading = true;
    if (mounted) setState(() {});

    var res = await client.from(widget.source).select().exec();
    total = res.length;

    loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width / 4.6,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: loading ? Colors.grey : widget.color,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            loading ? Icons.circle : widget.icon,
            size: 42.0,
            color: Colors.white,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loading ? "..." : "${widget.label}",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  loading ? "..." : "${total}",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
