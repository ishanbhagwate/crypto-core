
import 'package:flutter/material.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // color: AppTheme,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          
        ],
      ),
    );
  }
}