import 'package:flutter/material.dart';

import '../widgets/overview_widget.dart';
import '../widgets/top_widget.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopWidget(),
          OverviewWidget(),
          

        ],
      ),
    );
  }
}
