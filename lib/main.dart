import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_provider3/widgets/minutes_widget.dart';
import 'package:tuto_provider3/widgets/seconds_widget.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.dark,
    home: const HomePage(),
  ));
}

String now() => DateTime.now().toIso8601String();

@immutable
class Seconds {
  final String value;
  Seconds() : value = now();
}

@immutable
class Minutes {
  final String value;
  Minutes() : value = now();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: MultiProvider(
          providers: [
            StreamProvider.value(
              value: Stream<Seconds>.periodic(
                const Duration(seconds: 1),
                (_) => Seconds(),
              ),
              initialData: Seconds(),
            ),
            StreamProvider.value(
              value: Stream<Minutes>.periodic(
                const Duration(minutes: 1),
                (_) => Minutes(),
              ),
              initialData: Minutes(),
            ),
          ],
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: SecondsWidget(),
                  ),
                  Expanded(
                    child: MinutesWidget(),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
