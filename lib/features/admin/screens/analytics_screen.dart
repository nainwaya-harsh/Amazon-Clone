import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/admin/widgets/category_products.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Your Total Sales is \$$totalSales',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
//              SizedBox(
//   height: 250,
//   // child: CategoryProductsChart(
//   //   seriesList: [
//   //     charts.BarChartGroupData(
//   //       x: 0, // Assuming your x-axis values start from 0
//   //       barsSpace: 4,
//   //       barRods: earnings!.map((sales) {
//   //         return charts.BarChartRodData(
//   //           // y: sales.earning,
//   //           color: Colors.blueGrey, // Example color
//   //           width: 16, toY: 1, // Width of each bar
//   //         );
//   //       }).toList(),
//   //     ),
//   //   ],
//   // ),
// )
            ],
          );
  }
}
