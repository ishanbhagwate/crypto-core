import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loreum ipsum dolor sit amet consectetur adipiscing elit',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '10 mins ago',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/cryptocore_logo_light.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
