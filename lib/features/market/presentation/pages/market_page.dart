import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/coin_card_widget.dart';
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
          SizedBox(
            height: 15,
          ),
          Divider(),
          Animate(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 15,
                children: [
                  Row(
                    children: [
                      Text(
                        '#',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                  Text(
                    'Crypto',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Price',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '24h %',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ).fadeIn(duration: 450.ms),
          Expanded(
            child: Animate(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                itemBuilder: (context, index) {
                  return CoinCardWidget();
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: 10,
              ),
            ).fadeIn(duration: 450.ms),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
