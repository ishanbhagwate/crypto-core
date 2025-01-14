import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Animate(

      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 2,
                children: [
                  Text(
                    'Market Cap',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '\$3.34 T',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '8.60%',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 85,
                child: VerticalDivider(
                  width: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 2,
                children: [
                  Text(
                    'Altcoin Index',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '46 / 100',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '8.60%',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 85,
                child: VerticalDivider(
                  width: 1,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 2,
                children: [
                  Text(
                    'Fear & Greed',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '\$3.34 T',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '8.60%',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).fadeIn(duration: 450.ms);
  }
}
