import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_provider3/main.dart';

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final seconds = context.watch<Seconds>();
    return Container(
      height: 100,
      color: Colors.redAccent,
      child: Text(seconds.value),
    );
  }
}
