import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  const PrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: Theme.of(context).colorScheme.secondary,
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
