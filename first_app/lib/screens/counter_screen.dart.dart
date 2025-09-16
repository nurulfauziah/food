import 'package:first_app/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({
    super.key,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Counter'),
      ),
      body: Center(
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter \nProvider:',
                ),
                Consumer<CounterProvider>(
                    builder: (context, counterProvider, child) {
                  return Text(
                    '${counterProvider.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
