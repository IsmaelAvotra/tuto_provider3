import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_provider3/main.dart';

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final minutes = context.watch<Minutes>();
    return Container(
      height: 100,
      color: Colors.blueAccent,
      child: Text(minutes.value),
    );
  }
}
