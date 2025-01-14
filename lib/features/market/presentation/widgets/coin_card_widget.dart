import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CoinCardWidget extends StatelessWidget {
  const CoinCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 15,
        children: [
          Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 16,
                child: Image.asset(
                  'assets/images/cryptocore_logo_light.png',
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Polygon',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'MATIC',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          Text(
            '\$96,000',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 40,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(enabled: false),
                  gridData: FlGridData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      show: true,
                      isStrokeCapRound: true,
                      isStrokeJoinRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: Colors.green,
                      shadow: Shadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 15,
                        offset: Offset(0, 6),
                      ),
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 2),
                        FlSpot(2, 2),
                        FlSpot(3, 3),
                        FlSpot(4, 5),
                        FlSpot(5, 4),
                        FlSpot(6, 7),
                        FlSpot(7, 6),
                      ],
                      barWidth: 4,
                      isCurved: true,
                    )
                  ],
                ),
                duration: Duration(milliseconds: 150),
                curve: Curves.linear,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
